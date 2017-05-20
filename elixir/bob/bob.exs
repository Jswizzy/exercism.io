defmodule Bob do
  def hey(input) do
    cond do
    	input =~ ~r/.*\?$/          		 -> "Sure."
    	input =~ ~r/^[\t\s]*$/               -> "Fine. Be that way!"
    	input =~ ~r/^([^a-z]+\!|[^a-z\d]*)$/ -> "Whoa, chill out!"
    	true             		  			 -> "Whatever."
    end
  end
end