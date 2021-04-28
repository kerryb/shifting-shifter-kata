defmodule ShiftingShift do
  def decrypt(text) do
    text |> String.to_charlist() |> decrypt_chars() |> to_string
  end

  defp decrypt_chars([head | tail]) do
    [head | decrypt_chars(tail, offset_for_letter(head))]
  end

  defp decrypt_chars([], _offset) do
    []
  end

  defp decrypt_chars([head | tail], offset) do
    [shift(head, offset) | decrypt_chars(tail, offset)]
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
    letter - offset + 26
  end

  defp shift(letter, offset) do
    letter - offset
  end
end
