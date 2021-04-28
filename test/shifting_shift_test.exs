defmodule ShiftingShiftTest do
  use ExUnit.Case
  doctest ShiftingShift

  describe "ShiftingShift.decrypt/1" do
    test "returns the first letter unchanged" do
      assert ShiftingShift.decrypt("A") == "A"
    end
  end
end
