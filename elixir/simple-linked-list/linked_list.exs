defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    nil
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(l, elem), do: {elem, l}

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(nil), do: 0
  def length({_, rest}), do: 1 + LinkedList.length(rest)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(nil), do: true
  def empty?(_), do: false

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(nil), do: {:error, :empty_list}
  def peek({first, _rest}), do: {:ok, first}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(nil), do: {:error, :empty_list}
  def tail({_first, rest}), do: {:ok, rest}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(nil), do: {:error, :empty_list}
  def pop({first, rest}), do: {:ok, first, rest}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    list
    |> Enum.reverse()
    |> Enum.reduce(LinkedList.new(), &LinkedList.push(&2, &1))
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list), do: reduce_to_list(list, [])

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list), do: do_reverse(list, LinkedList.new())

  defp reduce_to_list(nil, acc), do: acc
  defp reduce_to_list({h, t}, acc), do: [h | reduce_to_list(t, acc)]

  defp do_reverse(nil, list), do: list
  defp do_reverse({h, t}, list), do: do_reverse(t, LinkedList.push(list, h))
end
