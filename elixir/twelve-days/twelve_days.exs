defmodule TwelveDays do
  @verses [
    [id: "twelfth", gift: "twelve Drummers Drumming"],
    [id: "eleventh", gift: "eleven Pipers Piping"],
    [id: "tenth", gift: "ten Lords-a-Leaping"],
    [id: "ninth", gift: "nine Ladies Dancing"],
    [id: "eighth", gift: "eight Maids-a-Milking"],
    [id: "seventh", gift: "seven Swans-a-Swimming"],
    [id: "sixth", gift: "six Geese-a-Laying"],
    [id: "fifth", gift: "five Gold Rings"],
    [id: "fourth", gift: "four Calling Birds"],
    [id: "third", gift: "three French Hens"],
    [id: "second", gift: "two Turtle Doves"],
    [id: "first", gift: "a Partridge in a Pear Tree."]
  ]

  @template "On the <%= id %> day of Christmas my true love gave to me: <%= gifts %>"

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    offset = 12 - number
    id = Enum.at(@verses, offset)[:id]

    gifts =
      @verses
      |> Enum.slice(offset, number)
      |> Enum.map(& &1[:gift])
      |> join_verses()

    EEx.eval_string(@template, id: id, gifts: gifts)
  end

  defp join_verses([verse]), do: verse

  defp join_verses(list) do
    {ending, rest} = List.pop_at(list, -1)
    beginning = rest |> Enum.join(", ")

    beginning <> ", and " <> ending
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    ending_verse..starting_verse
    |> Enum.map(&verse/1)
    |> Enum.reverse()
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing, do: verses(1, 12)
end
