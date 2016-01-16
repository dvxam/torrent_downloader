defmodule TorrentDownloader.CharGenerator do
  def generate(char, nb_of_chars) when nb_of_chars >= 0 do
    generate("", char, nb_of_chars)
  end

  defp generate(acumulator, _char, 0) do
    acumulator
  end

  defp generate(acumulator, char, nb_of_chars) do
    generate(acumulator <> char, char, nb_of_chars - 1)
  end
end
