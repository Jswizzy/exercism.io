defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> normalize()
    |> to_map()
  end

  defp normalize(sentence) do
    sentence
    |> String.replace(~r/[:,!&@$%^&]+/, "")
    |> String.downcase()
    |> String.split(~r/[\s_]+/)
  end

  defp to_map(words) when is_list(words) do
    Enum.reduce(words, %{}, &update_count/2)
  end

  defp update_count(word, acc) do
    Map.update acc, word, 1, &(&1 + 1)
  end
end
