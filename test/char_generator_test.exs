defmodule TorrentDownloader.CharGeneratorTest do
  use ExUnit.Case

  test "#generate generates the right amount of char" do
    assert TorrentDownloader.CharGenerator.generate(" ", 4) == "    "
  end

  test "#generate works with 1" do
    assert TorrentDownloader.CharGenerator.generate("c", 1) == "c"
  end
end
