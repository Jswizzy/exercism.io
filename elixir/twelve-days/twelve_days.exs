defmodule TwelveDays do
  @gifts """
 a Partridge in a Pear Tree.
 two Turtle Doves, and
 three French Hens,
 four Calling Birds,
 five Gold Rings,
 six Geese-a-Laying,
 seven Swans-a-Swimming,
 eight Maids-a-Milking,
 nine Ladies Dancing,
 ten Lords-a-Leaping,
 eleven Pipers Piping,
 twelve Drummers Drumming,
  """ |> String.split("\n", trim: true)

  @days ~w(zero first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth)

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    gifts = gifts(number)
    day = day(number)

    "On the #{day} day of Christmas my true love gave to me, #{gifts}"
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
      range = starting_verse..ending_verse

      range
      |> Enum.reduce([], fn(number,acc) ->  [verse(number)|acc] end)
      |> Enum.reverse()
      |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
    TwelveDays.verses(1, 12)
  end

  defp gifts(number) do
    Stream.take(@gifts, number) |> Enum.reverse |> Enum.join(" ")
  end

  defp day(number) do
    Enum.at(@days, number)
  end
end
