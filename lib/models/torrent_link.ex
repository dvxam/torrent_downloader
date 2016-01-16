defmodule TorrentDownloader.Models.TorrentLink do
  defstruct name: 'No name',
            size: "",
            seeds: 0,
            leechs: 0,
            page_url: ""
  alias TorrentDownloader.Models.TorrentLink

  def baseurl(%TorrentLink{page_url: page_url}) do
    uri = URI.parse(page_url)
    "#{uri.scheme}://#{uri.host}"
  end
end
