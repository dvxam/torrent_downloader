defmodule TorrentDownloader.Models.Torrent do
  defstruct name: 'No name',
            link: "",
            description: "",
            size: "",
            seeds: 0,
            leechs: 0
end
