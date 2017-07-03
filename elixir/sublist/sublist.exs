defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
        a === b ->
            :equal
        superlist?(a, b) ->
            :superlist
        sublist?(a, b) ->
            :sublist
        true ->
            :unequal
    end
  end

  def superlist?(first, last), do: sublist?(last, first)

  def sublist?(sublist, superlist) do
    sublist_len = length(sublist)
    super_len = length(superlist)

    cond do
      sublist_len > super_len ->
        false
      superlist |> Enum.take(sublist_len) === sublist ->
        true
      true ->
        sublist?(sublist, tl(superlist))
    end
  end
end
