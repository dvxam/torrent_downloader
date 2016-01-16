defmodule TorrentDownloader.Parsers.TorrentPageParser do
  import Floki
  alias TorrentDownloader.Models.Torrent
  alias TorrentDownloader.Models.TorrentLink

  def parse(html, torrent_link) do
    %Torrent{
      description: torrent_description(html),
      link: TorrentLink.baseurl(torrent_link) <> torrent_path(html),
      name: torrent_link.name,
      size: torrent_link.size,
      seeds: torrent_link.seeds,
      leechs: torrent_link.leechs
    }
  end

  defp torrent_description(html) do
    html
    |> find("#textefiche p")
    |> List.last
    |> text
  end

  defp torrent_path(html) do
    html
    |> find("#infosficher a#telecharger")
    |> attribute("href")
    |> List.first
  end
end
