defmodule TorrentDownloader.Reporter do
  alias TorrentDownloader.Models.Report

  def report_torrent(torrent, formatter) do
    %Report{}
    |> Report.add_line(formatter.first_line)
    |> Report.add_line(formatter.info_line(torrent.name))
    |> Report.add_lines(formatter.info_multiline(torrent.description))
    |> Report.add_line(formatter.horizontal_separator)
    |> Report.add_line(formatter.info_line("seeds: #{torrent.seeds}"))
    |> Report.add_line(formatter.info_line("leechs: #{torrent.leechs}"))
    |> Report.add_line(formatter.info_line("size: #{torrent.size}"))
    |> Report.add_line(formatter.info_line("url: #{torrent.link}"))
    |> Report.add_line(formatter.last_line)
    |> Report.render
  end
end
