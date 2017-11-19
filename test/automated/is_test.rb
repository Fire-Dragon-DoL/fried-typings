require "test_helper"
require "fried/typings/is"

class IsTest < Minitest::Spec
  Is = Fried::Typings::Is

  it "returns true when #valid? invoked with object of type in #[]" do
    valid = Is[String].valid?("test")

    assert valid == true
  end

  it "returns true when #valid? invoked with object of subtype in #[]" do
    customstring_class = Class.new(String)
    customstring = customstring_class.new("blah")

    valid = Is[String].valid?(customstring)

    assert valid == true
  end

  it "returns false when #valid? invoked with object of no type in #[]" do
    valid = Is[String].valid?(123)

    assert valid == false
  end

  it "returns true when #valid? invoked with object of Type" do
    is_string = Is[String]

    valid = Is[is_string].valid?("test")

    assert valid == true
  end
end
