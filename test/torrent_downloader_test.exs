defmodule TorrentDownloaderTest do
  use ExUnit.Case

  test "list lists some movies" do
    assert TorrentDownloader.movies |> List.first
  end

  test "series lists some series" do
    assert TorrentDownloader.series |> List.first
  end

  test "list " do
    TorrentDownloader.list
    #assert (TorrentDownloader.list |> String.length > 0
  end
end
