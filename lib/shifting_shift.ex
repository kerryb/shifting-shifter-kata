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
    [head - offset | decrypt_chars(tail, offset)]
  end

  defp offset_for_letter(letter) do
    letter - ?A + 1
  end
end
