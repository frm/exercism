defmodule Words do
  @non_word_characters ~r/[^\p{L}\-0-9]+/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(@non_word_characters, trim: true)
    |> Enum.reduce(%{}, &Map.update(&2, &1, 1, fn n -> n + 1 end))
  end
end
