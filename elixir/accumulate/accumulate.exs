defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    list
    |> my_map(fun, [])
  end

  defp my_map([], _, acc), do: Enum.reverse(acc)
  defp my_map([head | tail], fun, acc) do
     my_map(tail, fun, [ fun.(head) | acc ])
  end

end
