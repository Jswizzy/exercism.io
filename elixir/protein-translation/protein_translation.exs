defmodule ProteinTranslation do
  @cysteine "Cysteine"
  @leucine "Leucine"
  @methionine "Methionine"
  @phenylalanine "Phenylalanine"
  @serine "Serine"
  @tryptophan "Tryptophan"
  @tyrosine "Tyrosine"
  @stop "STOP"

  @invalid_codon "invalid codon"
  @invalid_rna "invalid RNA"
  
  @protein %{
    "UGU" => @cysteine,
    "UGC" => @cysteine,
    "UUA" => @leucine,
    "UUG" => @leucine,
    "AUG" => @methionine,
    "UUU" => @phenylalanine,
    "UUC" => @phenylalanine,
    "UCU" => @serine,
    "UCC" => @serine,
    "UCA" => @serine,
    "UCG" => @serine,
    "UGG" => @tryptophan,
    "UAU" => @tyrosine,
    "UAC" => @tyrosine,
    "UAA" => @stop,
    "UAG" => @stop,
    "UGA" => @stop
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    rna
    |> translation( [] )
  end

  defp translation(<<>>, acc), do: {:ok, acc}
  defp translation(<<char::binary-size(3), tail::binary>>, acc) do
    char
    |> of_codon
    |> check_protein(tail, acc)
  end

  defp check_protein({:error, _},   _tail, _acc), do: {:error, @invalid_rna}
  defp check_protein({:ok, @stop},  _tail, acc),  do: {:ok, acc}
  defp check_protein({:ok, protein}, tail, acc) do
    translation(tail, acc ++ [protein])
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    @protein
    |> Map.fetch(codon)
    |> handle_codon
  end

  defp handle_codon(:error), do: {:error, @invalid_codon}
  defp handle_codon(found),  do: found

end