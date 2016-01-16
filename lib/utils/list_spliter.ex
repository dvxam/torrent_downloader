defmodule TorrentDownloader.Utils.ListSpliter do
  def take_and_delete(list, n) do
    taken = Enum.take(list, n)
    tail = delete_multiple(list, n)
    [taken, tail]
  end

  defp delete_multiple(list, 0) do
    list
  end

  defp delete_multiple(list, n) do
    delete_multiple(List.delete_at(list, 0), n-1)
  end

  def split(list, n) do
    split([], list, n)
  end

  defp split(accumulator, [], _n) do
    accumulator
  end

  defp split(accumulator, list, n) do
    [taken| tail] = take_and_delete(list, n)
    split(accumulator ++ [taken], List.first(tail), n)
  end
end
