defmodule TorrentDownloader.CategorieParser do
  import Floki
  alias TorrentDownloader.Torrent

  def parse_main_page(html) do
    html
      |> find(".ligne0, .ligne1")
      |> Enum.map(&(parse_torrent(&1)))
  end

  def parse_torrent_page(html, torrent) do
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

  defp parse_torrent(torrent_html) do
    %Torrent{
      name: torrent_html |> find(".titre") |> text,
      size: torrent_html |> find(".poid") |> text,
      seeds: torrent_html |> find(".seed_ok") |> text,
      leechs: torrent_html |> find(".down") |> text,
      page_url: torrent_html |> find("a") |> attribute("href") |> List.first
    }
  end
end

defmodule TorrentDownloader do
  alias TorrentDownloader.CategorieParser
  alias TorrentDownloader.Reporter
  alias TorrentDownloader.TableFormatter

  def display_movies do
    movies
    |> Enum.map(fn torrent -> Reporter.report_torrent(torrent, TableFormatter) end)
    |> Enum.each(fn report -> IO.puts(report) end)
  end

  def movies do
    HTTPotion.get("http://www.cpasbien.io/view_cat.php?categorie=films").body
    |> CategorieParser.parse_main_page
    |> Enum.map(&(get_more(&1)))
  end

  defp get_more(torrent) do
    HTTPotion.get(torrent.page_url).body
    |> CategorieParser.parse_torrent_page(torrent)
  end
end

