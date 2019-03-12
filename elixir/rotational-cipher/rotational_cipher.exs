defmodule RotationalCipher do
  @lowercase_lower_bound 97
  @lowercase_upper_bound 122
  @uppercase_lower_bound 65
  @uppercase_upper_bound 90
  @alphabet_length 26

  defguard is_lowercase(chr) when chr >= @lowercase_lower_bound and chr <= @lowercase_upper_bound
  defguard is_uppercase(chr) when chr >= @uppercase_lower_bound and chr <= @uppercase_upper_bound

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(&shift_char(&1, shift))
    |> to_string()
  end

  defp shift_char(chr, shift) when is_uppercase(chr),
    do: shift_with(chr, shift, @uppercase_lower_bound)

  defp shift_char(chr, shift) when is_lowercase(chr),
    do: shift_with(chr, shift, @lowercase_lower_bound)

  defp shift_char(chr, _shift), do: chr

  defp shift_with(chr, shift, bound) do
    normalized_shift = rem(shift, @alphabet_length)
    normalized_chr = chr - bound

    shifted_chr = rem(normalized_chr + normalized_shift, @alphabet_length)

    shifted_chr + bound
  end
end
