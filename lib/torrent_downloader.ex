defmodule TorrentDownloader.CategorieParser do
  import Floki

  def parse(tuple) do
    tuple
      |> find(".ligne0, .ligne1")
      |> find(".titre")
      |> Enum.map(fn x -> %TorrentDownloader.Torrent{name: Floki.text(x)} end)
  end

  def extract_multiple_text(tuple) do
    Enum.map &(Floki.text(&1))
  end
end

defmodule TorrentDownloader do
  alias TorrentDownloader.CategorieParser
  alias TorrentDownloader.Reporter
  alias TorrentDownloader.TableFormatter

  def movies do
    HTTPotion.get("http://www.cpasbien.io/view_cat.php?categorie=films").body
      |> CategorieParser.parse
  end

  def display_movies do
    TorrentDownloader.movies
    |> Enum.map(fn torrent -> Reporter.report_torrent(torrent, TableFormatter) end)
    |> Enum.each(fn report -> IO.puts(report) end)
  end

  def series do
    HTTPotion.get("http://www.cpasbien.io/view_cat.php?categorie=series").body
      |> CategorieParser.parse
  end

  def list do
    IO.puts 'Movies'
    for movie <- movies, do: IO.puts(movie)
  end
end

