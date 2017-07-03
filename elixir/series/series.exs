defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s ,size) when is_bitstring(s) do
    len = String.length(s)
    for i <- 0..len, i + size <= len, size > 0, do: String.slice(s, i, size)
  end
end
