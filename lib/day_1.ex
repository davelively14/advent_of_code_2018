defmodule Day1 do
  def find_frequency(path \\ "lib/assets/day_1.txt") do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.reduce(0, fn val, acc ->
      parse_num(val) + acc
    end)
  end

  def freq_repeat(path \\ "lib/assets/day_1.txt") do
    list =
      path
      |> File.read!()
      |> String.split("\n")

    reduce(list)
  end

  # Private functions

  defp reduce(list), do: reduce(list, list, {0, MapSet.new([0])})
  defp reduce([], orig_list, acc), do: reduce(orig_list, orig_list, acc)
  defp reduce([head | tail], orig_list, {freq, map_set}) do
    new_freq = freq + parse_num(head)

    cond do
      MapSet.member?(map_set, new_freq) ->
        new_freq
      true ->
        reduce(tail, orig_list, {new_freq, MapSet.put(map_set, new_freq)})
    end
  end

  defp parse_num(val) do
    val
    |> String.split("\n")
    |> List.first()
    |> String.to_integer()
  end
end
