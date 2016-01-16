defmodule TorrentDownloader.Reporter do
  # @line_size = 56

  def report_torrent(%TorrentDownloader.Torrent{
    name: name,
    link: link,
    description: description,
    size: size,
    seeds: seeds,
    leechs: leechs}) do
    "┌──────────────────────────────────────────────────────┐" <> "\n"
    <> "│ " <> "#{name}" <> "                                         " <> "│" <> "\n"
    <> "│ " <> "#{description}" <> "                                " <> "│" <> "\n"
    <> "├──────────────────────────────────────────────────────┤" <> "\n"
    <> "│ " <> "seeds: #{seeds}" <> "                                          " <> "│" <> "\n"
    <> "│ " <> "leechs: #{leechs}" <> "                                         " <> "│" <> "\n"
    <> "│ " <> "size: #{size}" <> "                                          " <> "│" <> "\n"
    <> "│ " <> "url: #{link}" <> "                             " <> "│" <> "\n"
    <> "└──────────────────────────────────────────────────────┘" <> "\n"
  end
end
