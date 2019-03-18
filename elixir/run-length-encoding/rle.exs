defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.replace(~r/(.)\1*/, string, &do_encode/2)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.replace(~r/(\d+)(\D)/, string, &do_decode/3)
  end

  # NOTE: Could've also used byte_size/1 as a guard
  # or pattern match with <<head::...>> but doesn't work
  # for codepoints with two bytes.
  # It passes the tests, though :D
  defp do_encode(match, char) do
    case String.length(match) do
      x when x > 1 -> "#{x}#{char}"
      _ -> match
    end
  end

  defp do_decode(_, times, char) do
    char
    |> String.duplicate(String.to_integer(times))
  end
end
