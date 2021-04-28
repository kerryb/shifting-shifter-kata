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
  end
end
