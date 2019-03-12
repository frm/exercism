defmodule Acronym do
  @non_letters ~r/[^A-Za-z]+/
  @mixed_case ~r/([a-z])([A-Z])/

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(@non_letters, trim: true)
    |> Stream.map(&Regex.replace(@mixed_case, &1, "\\1 \\2"))
    |> Stream.flat_map(&String.split(&1, " "))
    |> Stream.map(&String.at(&1, 0))
    |> Stream.map(&String.upcase/1)
    |> Enum.join("")
  end
end
