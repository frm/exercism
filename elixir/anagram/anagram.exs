defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_chars = sorted_chars(base)
    downcased_base = String.downcase(base)

    candidates
    |> Enum.filter(fn candidate ->
      String.downcase(candidate) != downcased_base && sorted_chars(candidate) == base_chars
    end)
  end

  defp sorted_chars(str) do
    str
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end
