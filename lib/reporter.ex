defmodule TorrentDownloader.Reporter do
  def report_torrent(%TorrentDownloader.Torrent{
    name: name,
    link: link,
    description: description,
    size: size,
    seeds: seeds,
    leechs: leechs}) do
    first_line <> "\n"
    <> info_line(name) <> "\n"
    <> info_line(description) <> "\n"
    <> horizontal_separator <> "\n"
    <> info_line("seeds: #{seeds}") <> "\n"
    <> info_line("leechs: #{leechs}") <> "\n"
    <> info_line("size: #{size}") <> "\n"
    <> info_line("url: #{link}") <> "\n"
    <> last_line <> "\n"
  end

  defp first_line do
    "┌──────────────────────────────────────────────────────┐"
  end

  defp info_line(string) do
    "│ " <> name_with_space_to(string, 52) <> " │"
  end

  defp horizontal_separator do
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
