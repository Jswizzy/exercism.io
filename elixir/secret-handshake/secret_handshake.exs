defmodule SecretHandshake do
  @codes ["wink", "double blink", "close your eyes", "jump", :reverse]
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
    digits = for <<bit::1 <- <<code::5>> >>, do: bit

    digits
    |> Enum.reverse()
    |> Enum.zip(@codes)
    |> get_commands()
  end

  defp get_commands(codes) do
    commands =
      for {1, command} <- codes, do: command

    reverse? =
      commands
      |> Enum.member?(:reverse)

    case reverse? do
      :false -> commands
      :true  ->
        Enum.reverse(commands)
        |> Enum.slice(1..-1)
    end
  end
end
