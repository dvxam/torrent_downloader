defmodule TorrentDownloader.Models.Report do
  defstruct content: ""
  alias TorrentDownloader.Models.Report

  def add_line(%Report{content: content}, line) do
    %Report{content: content <> line <> "\n"}
  end

  def render(%Report{content: content}) do
    content
  end
end
