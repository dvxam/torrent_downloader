defmodule TorrentDownloader.Models.Report do
  defstruct content: ""
  alias TorrentDownloader.Models.Report

  def add_line(%Report{content: content}, line) do
    %Report{content: content <> line <> "\n"}
  end

  def add_lines(report, lines) do
    bulk = Enum.join(lines, "\n")
    add_line(report, bulk)
  end

  def render(%Report{content: content}) do
    content
  end
end
