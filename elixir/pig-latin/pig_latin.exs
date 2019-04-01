defmodule PigLatin do
  @consonant "[^aeiou]"
  @vowel "[aeiou]"
  @vowel_sound ~r/^(#{@vowel}|y#{@consonant}|x#{@consonant})/
  @consonant_sound ~r/^(#{@consonant}*qu|#{@consonant}+)(.*)/

  @suffix "ay"

  # @dictionary %{
  #   @vowel_sound => fn word, _, _ -> word <> @suffix end,
  #   @consonant_sound => fn _, head, tail -> tail <> head <> @suffix end,
  #   @qu_sound => fn _, head, tail ->
  # }

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&translate_word/1)
    |> Enum.join(" ")
  end

  defp translate_word(word) do
    cond do
      Regex.match?(@vowel_sound, word) ->
        word <> @suffix

      match = Regex.run(@consonant_sound, word) ->
        [_, head, tail] = match
        tail <> head <> @suffix

      true ->
        word
    end
  end
end
