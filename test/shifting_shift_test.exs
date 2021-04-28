defmodule ShiftingShiftTest do
  use ExUnit.Case
  doctest ShiftingShift

  describe "ShiftingShift.decrypt/1" do
    test "returns the first letter unchanged" do
      assert ShiftingShift.decrypt("A") == "A"
    end

    test "shifts subsequent letters backwards by the number value of the first letter" do
      assert ShiftingShift.decrypt("EMP") == "EHK"
    end

    test "ignores case" do
      assert ShiftingShift.decrypt("emp") == "ehk"
    end

    test "wraps round the beginning of the alphabet" do
      assert ShiftingShift.decrypt("EaB") == "EvW"
    end

    test "increments the shift for subsequent letters when the decrypted letter is an upper or lower case vowel" do
      assert ShiftingShift.decrypt("EFxkx") == "EAreq"
    end
  end
end
