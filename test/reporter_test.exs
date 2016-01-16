defmodule TorrentDownloader.ReporterTest do
  use ExUnit.Case
  alias TorrentDownloader.Models.Torrent

  test "#report_torrent displays a torrent" do
    torrent = %Torrent{
      name: "Star Wars VI",
      link: "torrent://host/path",
      description: "The best disney ever.",
      size: "7.9Go",
      seeds: 2778,
      leechs: 3998}
    formatter = TorrentDownloader.TableFormatter
    assert TorrentDownloader.Reporter.report_torrent(torrent, formatter) == """
    ┌──────────────────────────────────────────────────────┐
    │ Star Wars VI                                         │
    │ The best disney ever.                                │
    ├──────────────────────────────────────────────────────┤
    │ seeds: 2778                                          │
    │ leechs: 3998                                         │
    │ size: 7.9Go                                          │
    │ url: torrent://host/path                             │
    └──────────────────────────────────────────────────────┘
    """
  end

  # test "#report_torrent adapts it's size" do
  #   torrent = %TorrentDownloader.Torrent{
  #     name: "Star Wars VI",
  #     link: "torrent://host/path",
  #     description: "The best disney ever.",
  #     size: "7.9Go",
  #     seeds: 2778,
  #     leechs: 3998}
  #   assert TorrentDownloader.Reporter.report_torrent(torrent) == """
  #   ┌──────────────────────────────────────────────────────┐
  #   │ La vie est belle - torrent://host/path               │
  #   ├──────────────┬───────────────────────────────────────┤
  #   │ seeds: 27782 │ The best disney ever. The best disney │
  #   │ leechs: 3998 │ ever. The best disney ever. The best  │
  #   │ size: 7.9Go  │ disney ever. The best disney ever...  │
  #   └──────────────┴───────────────────────────────────────┘
  #   """
  # end
end
