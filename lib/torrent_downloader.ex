defmodule TorrentDownloader do
  alias TorrentDownloader.Parsers.CategorieParser
  alias TorrentDownloader.Parsers.TorrentPageParser
  alias TorrentDownloader.Reporter
  alias TorrentDownloader.TableFormatter

  def display_movies do
    movies
    |> Enum.map(fn torrent -> Reporter.report_torrent(torrent, TableFormatter) end)
    |> Enum.each(fn report -> IO.puts(report) end)
  end

  def movies do
    HTTPotion.get("http://www.cpasbien.io/view_cat.php?categorie=films").body
    |> CategorieParser.parse
    |> Enum.map(&(get_more(&1)))
  end

  defp get_more(torrent) do
    HTTPotion.get(torrent.page_url).body
    |> TorrentPageParser.parse(torrent)
  end
end

