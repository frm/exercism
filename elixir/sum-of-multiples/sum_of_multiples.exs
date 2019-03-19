defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    mults =
      for i <- 1..limit,
          f <- factors,
          f * i < limit,
          uniq: true,
          do: f * i

    Enum.sum(mults)
  end
end
