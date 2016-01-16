defmodule TorrentDownloader.Report do
  defstruct content: ""

  def add_line(%TorrentDownloader.Report{content: content}, line) do
    %TorrentDownloader.Report{content: content <> line <> "\n"}
  end

  def render(%TorrentDownloader.Report{content: content}) do
    content
  end
end

defmodule TorrentDownloader.Reporter do
  def report_torrent(torrent, formatter) do
    %TorrentDownloader.Report{}
    |> TorrentDownloader.Report.add_line(formatter.first_line)
    |> TorrentDownloader.Report.add_line(formatter.info_line(torrent.name))
    |> TorrentDownloader.Report.add_line(formatter.info_line(torrent.description))
    |> TorrentDownloader.Report.add_line(formatter.horizontal_separator)
    |> TorrentDownloader.Report.add_line(formatter.info_line("seeds: #{torrent.seeds}"))
    |> TorrentDownloader.Report.add_line(formatter.info_line("leechs: #{torrent.leechs}"))
    |> TorrentDownloader.Report.add_line(formatter.info_line("size: #{torrent.size}"))
    |> TorrentDownloader.Report.add_line(formatter.info_line("url: #{torrent.link}"))
    |> TorrentDownloader.Report.add_line(formatter.last_line)
    |> TorrentDownloader.Report.render
  end
end
