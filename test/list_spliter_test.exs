defmodule TorrentDownloader.Utils.ListSpliterTest do
  use ExUnit.Case
  alias TorrentDownloader.Utils.ListSpliter

  test '#split splits list' do
    assert ListSpliter.split([1, 2, 3, 4, 5, 6, 7], 3) == [[1, 2, 3], [4, 5, 6], [7]]
  end

  test '#split splits list and let no trailing empty list' do
    assert ListSpliter.split([1, 2, 3, 4, 5, 6], 3) == [[1, 2, 3], [4, 5, 6]]
  end

  test '#take_and_delete' do
    assert ListSpliter.take_and_delete([1, 2, 3, 4, 5], 2) == [[1, 2], [3, 4, 5]]
  end
end
