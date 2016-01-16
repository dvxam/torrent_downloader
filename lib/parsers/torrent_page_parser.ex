defmodule TorrentDownloader.Parsers.TorrentPageParser do
  import Floki
  alias TorrentDownloader.Models.Torrent

  def parse(html, torrent) do
    %Torrent{
      description: torrent_description(html),
      link: torrent_url(html),
      name: torrent.name,
      size: torrent.size,
      seeds: torrent.seeds,
      leechs: torrent.leechs
    }
  end

  defp torrent_description(html) do
    html
    |> find("#textefiche p")
    |> List.last
    |> text
  end

  defp torrent_url(html) do
    html
    |> find("#infosficher a#telecharger")
    |> attribute("href")
    |> List.first
  end
end
