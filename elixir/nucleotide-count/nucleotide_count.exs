defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @nucleotide_list [{?A, 0}, {?C, 0}, {?G, 0}, {?T, 0}]
  @strand_regex ~r/^[ACGT]+$/

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count('', n) when n in @nucleotides, do: 0
  def count('', _), do: raise ArgumentError
  def count(strand, nucleotide) do
    strand |> parse_strand |> do_count(nucleotide)
  end

  defp do_count(strand, nucleotide) do
    strand
      |> Enum.reduce(0, fn(n, sum) ->
        if n == nucleotide, do: sum + 1, else: sum
      end
    )
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram([]), do: empty_histogram
  def histogram(strand) do
    strand |> parse_strand |> do_histogram
  end

  defp do_histogram(strand) do
    strand
      |> Enum.reduce(empty_histogram, fn(n, count) ->
        {_, val} = Map.get_and_update(count, n, fn val -> {val, val + 1} end)
        val
        end
      )
  end

  defp empty_histogram, do: Map.new(@nucleotide_list)

  defp parse_strand(strand) do
    cond do
      Regex.match?(@strand_regex, to_string(strand)) -> strand
      true -> raise ArgumentError
    end
  end
end
