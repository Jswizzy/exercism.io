defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(
      fn(candidate) -> anagram?(normalize(candidate), normalize(base)) end)
  end

  def anagram?(word, base) when length(base) == length(word) do
    word != base &&
      Enum.empty?(word -- base)
  end
  def anagram?(_,_), do: false

  defp normalize(string) do
    string
    |> String.downcase()
    |> String.graphemes()
  end
end
