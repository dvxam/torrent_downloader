defmodule TorrentDownloader.Torrent do
  defstruct name: 'No name',
            link: nil,
            description: nil,
            size: nil,
            seeds: 0,
            leechs: 0
end
