defmodule TorrentDownloaderTest do
  use ExUnit.Case

  test "list lists some movies" do
    assert TorrentDownloader.list(:movies) == "Stung FRENCH DVDRIP 2015"
  end
end
