defmodule RunLengthEncoder do
  @count_data ~r/(\d*)(.)/
  @char ~r/(.)\1*/
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(@char, string)
    |> Enum.map_join(&do_encode/1)
  end

  defp do_encode([ch,    ch]), do: ch
  defp do_encode([chars, ch]), do: "#{String.length(chars)}#{ch}"

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(@count_data, string, capture: :all_but_first)
    |> Enum.map_join(&do_decode/1)
  end

  defp do_decode(["", ch]), do: ch
  defp do_decode([count, ch]) do
    String.duplicate(ch, String.to_integer(count))
  end
end
