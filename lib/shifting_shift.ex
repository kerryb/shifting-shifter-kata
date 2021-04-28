defmodule ShiftingShift do
  @doc """
  Decrypt a string according to the algorithm described in `README`.

  ## Examples (these are executed with the tests):

      iex> ShiftingShift.decrypt("acdefhi")
      "abcdefg"

      iex> ShiftingShift.decrypt("Sthnu nvuo 'dk el fm'")
      "Santa says 'ho ho ho'"

      iex> ShiftingShift.decrypt("12 Dedx Tl Khabma")
      "12 Days Of Easter"
  """
  def decrypt(text) do
    # Convert [unicode] string to charlist so we can do arithmetic on the individual chars
    text |> String.to_charlist() |> decrypt_chars() |> to_string
  end

  defp decrypt_chars([head | tail]) when head in ?A..?Z or head in ?a..?z do
    [head | decrypt_chars(tail, offset_for_letter(head))]
  end

  defp decrypt_chars([head | tail]) do
    # keep passing non-alpha chars unchanged until we hit a letter
    [head | decrypt_chars(tail)]
  end

  defp decrypt_chars([], _offset) do
    []
  end

  defp decrypt_chars([head | tail], offset) when head in ?A..?Z or head in ?a..?z do
    letter = shift(head, offset)
    [letter | decrypt_chars(tail, update_offset(offset, letter))]
  end

  defp decrypt_chars([head | tail], offset) do
    # pass non-alphas through unchanged
    [head | decrypt_chars(tail, offset)]
  end

  defp offset_for_letter(letter) when letter in ?A..?Z do
    letter - ?A + 1
  end

  defp offset_for_letter(letter) when letter in ?a..?z do
    letter - ?a + 1
  end

  defp shift(letter, offset)
       when (letter in ?A..?Z and letter < ?A + offset) or
              (letter in ?a..?z and letter < ?a + offset) do
    # wrap round when offset would take us out of the alphabet
    letter - offset + 26
  end

  defp shift(letter, offset) do
    letter - offset
  end

  defp update_offset(offset, letter) when letter in 'AEIOUaeiou' do
    Integer.mod(offset + 1, 26)
  end

  defp update_offset(offset, _letter) do
    offset
  end
end
