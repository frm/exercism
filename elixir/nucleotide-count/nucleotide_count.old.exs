defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @nucleotide_list [{?A, 0}, {?C, 0}, {?G, 0}, {?T, 0}]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    {strand, nucleotide} |> do_count
  end

  defp do_count([], _), do: 0
  defp do_count({nucleotide, strand}) do
    strand
      |> Enum.reduce(0, fn(n, sum) ->
        if n == nucleotide, do: sum + 1, else: sum
      end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand |> do_histogram
  end

  defp do_histogram(strand) do
    strand
      |> Enum.reduce(Map.new(@nucleotide_list), fn(n, sum) ->
        {_, m} = sum |> Map.get_and_update(n, fn val -> {val, val + 1} end)
        m
      end
      )
  end

  defp parse_strand(strand) do
    cond do
      Regex.match?(~r/[ACGT]+/, to_string(strand)) -> strand
      true -> raise ArgumentError
    end
  end

  defp parse_nucleotide(nucleotide) do
    cond do
      Enum.member?(@nucleotides, nucleotide) -> nucleotide
      true -> raise ArgumentError
    end
  end
end
