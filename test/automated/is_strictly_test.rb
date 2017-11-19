require "test_helper"
require "fried/typings/is_strictly"

class IsStrictlyTest < Minitest::Spec
  IsStrictly = Fried::Typings::IsStrictly

  it "returns true when #valid? invoked with object of type in #[]" do
    valid = IsStrictly[String].valid?("test")

    assert valid == true
  end

  it "returns false when #valid? invoked with object of subtype in #[]" do
    customstring_class = Class.new(String)
    customstring = customstring_class.new("blah")

    valid = IsStrictly[String].valid?(customstring)

    assert valid == false
  end

  it "returns false when #valid? invoked with object of no type in #[]" do
    valid = IsStrictly[String].valid?(123)

    assert valid == false
  end

  it "returns true when #valid? invoked with object of Type" do
    is_string = IsStrictly[String]

    valid = IsStrictly[is_string].valid?("test")

    assert valid == true
  end
end
