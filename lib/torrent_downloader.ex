defmodule TorrentDownloader do

  def list(:movies) do
    HTTPotion.get("www.cpasbien.pw").body
      |> Floki.parse
      |> Floki.find(".ligne0")
      |> Floki.find(".titre")
      |> List.first
      |> Floki.text
  end
end

