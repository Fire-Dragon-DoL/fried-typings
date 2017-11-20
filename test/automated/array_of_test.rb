require "test_helper"
require "fried/typings/array_of"

class ArrayOfTest < Minitest::Spec
  ArrayOf = Fried::Typings::ArrayOf

  it "returns true when #valid? invoked with empty array" do
    valid = ArrayOf[Numeric].valid?([])

    assert valid == true
  end

  it "returns true when #valid? invoked with array of type in #[]" do
    valid = ArrayOf[Numeric].valid?([123, 456])

    assert valid == true
  end

  it "returns false when #valid? invoked with array not of type in #[]" do
    valid = ArrayOf[Numeric].valid?([:test])

    assert valid == false
  end
end
