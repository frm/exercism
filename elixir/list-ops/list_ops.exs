defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)

  defp do_count([], acc), do: acc
  defp do_count([_ | t], acc), do: do_count(t, acc + 1)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])

  defp do_reverse([], rev), do: rev
  defp do_reverse([h | t], rev), do: do_reverse(t, [h | rev])

  @spec map(list, (any -> any)) :: list
  def map([], f), do: []
  def map([h | t], f), do: [f.(h) | map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], f), do: []

  def filter([h | t], f) do
    if f.(h) do
      [h | filter(t, f)]
    else
      filter(t, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([h | t], acc, f), do: reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(l, []), do: l
  def append([], l), do: l
  def append([h | t], l), do: [h | append(t, l)]

  # this works but is incredibly inneficient
  # def concat(ll), do: reduce(ll, [], &append(&2, &1))
  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([l]), do: l
  def concat([[], b | t]), do: concat([b | t])
  def concat([[ha | ta], b | t]), do: [ha | concat([ta, b | t])]
end
