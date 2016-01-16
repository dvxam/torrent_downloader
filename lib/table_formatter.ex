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
    "#{string}" <> TorrentDownloader.CharGenerator.generate(" ", spacesc)
  end
end
