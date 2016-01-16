defmodule TorrentDownloader.Parsers.CategorieParser do
  import Floki
  alias TorrentDownloader.Models.TorrentLink

  def parse(html) do
    html
      |> find(".ligne0, .ligne1")
      |> Enum.map(&(parse_torrent(&1)))
  end

  defp parse_torrent(torrent_html) do
    %TorrentLink{
      name: torrent_html |> find(".titre") |> text,
      size: torrent_html |> find(".poid") |> text,
      seeds: torrent_html |> find(".seed_ok") |> text,
      leechs: torrent_html |> find(".down") |> text,
      page_url: torrent_html |> find("a") |> attribute("href") |> List.first
    }
  end
end
