defmodule TorrentDownloader.Parsers.TorrentPageParser do
  import Floki
  alias TorrentDownloader.Models.Torrent

  def parse(html, torrent) do
    description = get_torrent_description(html)
    url = get_torrent_url(html)
    %{torrent | description: description, link: url}
  end

  defp get_torrent_description(html) do
    html
    |> find("#textefiche p")
    |> List.last
    |> text
  end

  defp get_torrent_url(html) do
    html
    |> find("#infosficher a")
    |> attribute("href")
    |> List.first
  end
end
