require "test_helper"
require "fried/typings/strictly_one_of"
require "fried/typings/meta_type"

class StrictlyOneOfTest < Minitest::Spec
  StrictlyOneOf = Fried::Typings::StrictlyOneOf

  it "returns false if initialized without types" do
    valid = StrictlyOneOf[].valid?(123)

    assert valid == false
  end

  it "returns true when #valid? invoked with object of type in #[]" do
    valid = StrictlyOneOf[String, NilClass].valid?("test")

    assert valid == true
  end

  it "returns false when #valid? invoked with object of subtype in #[]" do
    customstring_class = Class.new(String)

    valid = StrictlyOneOf[customstring_class, NilClass].valid?("test")

    assert valid == false
  end

  it "returns false when #valid? invoked with object of no type in #[]" do
    valid = StrictlyOneOf[String, NilClass].valid?(123)

    assert valid == false
  end

  it "returns true when #valid? invoked with object of nested Type" do
    string_nil = StrictlyOneOf[String, NilClass]

    valid = StrictlyOneOf[Numeric, string_nil].valid?("test")

    assert valid == true
  end
end
