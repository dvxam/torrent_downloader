defmodule TorrentDownloader.TableFormatter do
  def first_line do
    "┌──────────────────────────────────────────────────────┐"
  end

  def info_line(string) do
    "│ " <> name_with_space_to(string, 52) <> " │"
  end

  def horizontal_separator do
    "├──────────────────────────────────────────────────────┤"
  end

  def last_line do
    "└──────────────────────────────────────────────────────┘"
  end

  defp name_with_space_to(string, final_size) do
    spacesc = final_size - String.length(string)
    cond do
      spacesc < 0 -> cut_string_with_dots(string, final_size)
      true -> complete_with_spaces(string, spacesc)
    end
  end

  defp complete_with_spaces(string, spaces) when spaces >= 0 do
    "#{string}" <> TorrentDownloader.CharGenerator.generate(" ", spaces
      )
  end

  defp cut_string_with_dots(string, final_size) do
    String.slice(string, 0, final_size - 3)
      <> TorrentDownloader.CharGenerator.generate(".", 3)
  end
end
