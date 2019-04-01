defmodule Roman do
  @dictionary [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number), do: do_numerals(number, "")

  defp do_numerals(n, acc) when n < 1, do: acc

  defp do_numerals(n, acc) do
    {dec, rom} = Enum.find(@dictionary, fn {val, _} -> val <= n end)
    do_numerals(n - dec, acc <> rom)
  end
end
