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
  def report_torrent(%TorrentDownloader.Torrent{
    name: name,
    link: link,
    description: description,
    size: size,
    seeds: seeds,
    leechs: leechs}) do
    %TorrentDownloader.Report{}
    |> TorrentDownloader.Report.add_line(first_line)
    |> TorrentDownloader.Report.add_line(info_line(name))
    |> TorrentDownloader.Report.add_line(info_line(description))
    |> TorrentDownloader.Report.add_line(horizontal_separator)
    |> TorrentDownloader.Report.add_line(info_line("seeds: #{seeds}"))
    |> TorrentDownloader.Report.add_line(info_line("leechs: #{leechs}"))
    |> TorrentDownloader.Report.add_line(info_line("size: #{size}"))
    |> TorrentDownloader.Report.add_line(info_line("url: #{link}"))
    |> TorrentDownloader.Report.add_line(last_line)
    |> TorrentDownloader.Report.render
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
