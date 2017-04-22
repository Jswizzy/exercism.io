defmodule RotationalCipher do
  @mod 26

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map( &do_rotate(&1, shift) )
    |> to_string
  end

  defp do_rotate(ch, n) do
    cond do
      ch in ?a..?z ->
        ?a + rem( ch + n - ?a, @mod )
      ch in ?A..?Z ->
        ?A + rem( ch + n - ?A,  @mod )
      true ->
        ch
    end
  end
end