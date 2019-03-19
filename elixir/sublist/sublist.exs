defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  # NOTE: This is the recursive implementation which takes a huge time
  # to compute for big lists ~ O(N^N). I recommend trying this out and
  # seeing that it basically does not end for the test on line 52 --
  # "huge sublist not in huge list".
  #
  # def compare(a, a), do: :equal
  # def compare([], _), do: :sublist
  # def compare(_, []), do: :superlist
  # def compare(a, b) when length(a) == length(b), do: :unequal
  # def compare(a, b) when length(a) < length(b), do: do_compare(a, b)

  # def compare(a, b) do
  #   case do_compare(b, a) do
  #     :sublist -> :superlist
  #     result -> result
  #   end
  # end

  # defp do_compare([hb], [hb | _]), do: :sublist
  # defp do_compare(_, []), do: :unequal

  # defp do_compare([h | ta] = a, [h | tb]) do
  #   case do_compare(ta, tb) do
  #     :unequal -> do_compare(a, tb)
  #     result -> result
  #   end
  # end

  # defp do_compare([_ha | _] = a, [_hb | tb]), do: do_compare(a, tb)
  #
  #
  # Alternatively, we can use the Enum module. We drop all values until
  # we find a common beginning. Then we zip the two lists together.
  # If the result has a smaller length than the original list, then they
  # are unequal. If they have similar length and all pairs are equal,
  # it's a sublist.

  def compare(a, a), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist
  def compare(a, b) when length(a) < length(b), do: do_compare(a, b)

  def compare(a, b) do
    case do_compare(b, a) do
      :sublist -> :superlist
      result -> result
    end
  end

  defp do_compare(a, a), do: :sublist
  defp do_compare([], _), do: :unequal
  defp do_compare(_, []), do: :unequal

  defp do_compare([ha | _] = a, [_ | tb] = b) do
    zipped = b |> Enum.drop_while(&(&1 != ha)) |> Enum.zip(a)

    cond do
      length(zipped) < length(a) -> :unequal
      Enum.all?(zipped, fn {x, y} -> x === y end) -> :sublist
      true -> do_compare(a, tb)
    end
  end
end
