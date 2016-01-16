defmodule TorrentDownloader.TableFormatter do
  alias TorrentDownloader.CharGenerator
  alias TorrentDownloader.Utils.ListSpliter

  defp line_size do
    52
  end

  def first_line do
    "┌" <> CharGenerator.generate("─", line_size + 2) <> "┐"
  end

  def horizontal_separator do
    "├" <> CharGenerator.generate("─", line_size + 2) <> "┤"
  end

  def last_line do
    "└" <> CharGenerator.generate("─", line_size + 2) <> "┘"
  end

  def info_line(string) do
    "│ " <> name_with_space_to(string, line_size) <> " │"
  end

  def info_multiline(string) do
    to_char_list(string)
    |> ListSpliter.split(line_size)
    |> Enum.map(&( info_line(to_string(&1) )))
  end

  defp split_by(collection, n) do
    split_by([], collection, n)
  end

  defp split_by(accumulator, collection, n) do
    split_by(List.insert_at(accumulator, 0, collection.take(n)), collection, n)
  end

  defp name_with_space_to(string, final_size) do
    spacesc = final_size - String.length(string)
    cond do
      spacesc < 0 -> cut_string_with_dots(string, final_size)
      true -> complete_with_spaces(string, spacesc)
    end
  end

  defp complete_with_spaces(string, spaces) when spaces >= 0 do
    "#{string}" <> CharGenerator.generate(" ", spaces
      )
  end

  defp cut_string_with_dots(string, final_size) do
    String.slice(string, 0, final_size - 3)
      <> CharGenerator.generate(".", 3)
  end
end
