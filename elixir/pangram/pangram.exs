defmodule Pangram do
  @alphabet_size 26

  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    letters =
      sentence
      |> String.downcase()
      |> String.graphemes()
      |> Stream.uniq()
      |> Stream.filter(&(&1 =~ ~r/[a-z]/))
      |> Enum.count()

    letters == @alphabet_size
  end
end
