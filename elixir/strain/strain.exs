defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: do_keep(list, [], fun)

  defp do_keep([], acc, _), do: acc

  defp do_keep([h | t], acc, fun) do
    tail = do_keep(t, acc, fun)
    if fun.(h), do: [h | tail], else: tail
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: do_discard(list, [], fun)

  defp do_discard([], acc, _), do: acc

  defp do_discard([h | t], acc, fun) do
    tail = do_discard(t, acc, fun)
    if fun.(h), do: tail, else: [h | tail]
  end
end
