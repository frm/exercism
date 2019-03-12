defmodule Raindrops do
  # Before reviewing this:
  # I really just tried to do it in a way that reviewers didn't think
  # realize what was happening. The real solution should be:
  #
  # @raindrops %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  #
  # def convert(number) do
  #   Enum.reduce(@raindrops, "", fn
  #     {factor, str}, acc when rem(number, factor) == 0 -> acc <> str
  #     _, acc -> acc
  #   end)
  #   |> case do
  #     "" -> to_string(number)
  #     raindrop -> raindrop
  #   end
  # end

  @factors [7, 5, 3]
  @values ["Pling", "Plong", "Plang"]
  @size 3

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    Enum.reduce(@factors, "", fn factor, acc ->
      %{
        true: Enum.at(@values, rem(factor, @size)),
        false: ""
      }[rem(number, factor) == 0] <> acc
    end)
    |> case do
      "" -> to_string(number)
      raindrop -> raindrop
    end
  end
end
