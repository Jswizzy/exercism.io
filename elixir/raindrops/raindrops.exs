defmodule Raindrops do
  @msgs [{3,"Pling"},{5,"Plang"},{7,"Plong"}]
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    do_convert(number, @msgs, "")
  end

  defp do_convert(n, [], ""),   do: n |> to_string()
  defp do_convert(_, [], msgs), do: msgs
  defp do_convert(n, [{f, msg}|t], msgs) when rem(n, f) === 0 do
     do_convert(n, t, msgs <> msg)
  end
  defp do_convert(n, [_|t], msgs), do: do_convert(n, t, msgs)
end
