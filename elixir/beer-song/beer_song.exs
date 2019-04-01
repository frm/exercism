defmodule BeerSong do
  @template """
  <%= String.capitalize(amount) %> <%= bottle %> of beer on the wall, <%= amount %> <%= bottle %> of beer.
  <%= String.capitalize(action) %>, <%= new_amount %> <%= new_bottle %> of beer on the wall.
  """
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(n) do
    opts = bottle(n) ++ count(n) ++ action(n)

    EEx.eval_string(@template, opts)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  def lyrics, do: lyrics(99..0)

  defp bottle(2), do: [bottle: "bottles", new_bottle: "bottle"]
  defp bottle(1), do: [bottle: "bottle", new_bottle: "bottles"]
  defp bottle(_), do: [bottle: "bottles", new_bottle: "bottles"]

  defp count(1), do: [amount: "1", new_amount: "no more"]
  defp count(0), do: [amount: "no more", new_amount: "99"]
  defp count(n), do: [amount: to_string(n), new_amount: to_string(n - 1)]

  defp action(1), do: [action: "Take it down and pass it around"]
  defp action(0), do: [action: "Go to the store and buy some more"]
  defp action(_), do: [action: "Take one down and pass it around"]
end
