defmodule SecretHandshake do
  use Bitwise, only_operators: true

  # I know this is mostly unreadable and not the best option.
  # The challenge here was using Bitwise
  # and having it in a way that commands/1 would treat
  # every bitmask as equal. Hence the {fun, arg} format
  @bitmasks %{
    8 => {&__MODULE__.add/2, "jump"},
    4 => {&__MODULE__.add/2, "close your eyes"},
    2 => {&__MODULE__.add/2, "double blink"},
    1 => {&__MODULE__.add/2, "wink"},
    16 => {&__MODULE__.reverse/2, nil}
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> apply_bitmasks()
    |> Enum.reverse()
  end

  def add(list, element), do: [element | list]
  def reverse(list, nil), do: Enum.reverse(list)

  # if any bitmask is valid, then apply the function it is assigned to
  defp apply_bitmasks(number) do
    Enum.reduce(@bitmasks, [], fn
      {mask, {fun, arg}}, acc when (mask &&& number) != 0 -> fun.(acc, arg)
      _, acc -> acc
    end)
  end
end
