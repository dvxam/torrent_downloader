defmodule TorrentDownloader.Torrent do
  defstruct name: 'No name',
            link: "",
            description: "",
            size: "",
            seeds: 0,
            leechs: 0,
            page_url: ""
end
