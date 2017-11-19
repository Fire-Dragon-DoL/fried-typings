require "test_helper"
require "fried/typings/one_of"
require "fried/typings/meta_type"

class OneOfTest < Minitest::Spec
  OneOf = Fried::Typings::OneOf

  it "raises if initialized without types" do
    assert_raises Fried::Typings::MetaType::MissingTypeError do
      OneOf[]
    end
  end

  it "returns true when #valid? invoked with object of type in #[]" do
    valid = OneOf[String, NilClass].valid?("test")

    assert valid == true
  end

  it "returns true when #valid? invoked with object of subtype in #[]" do
    customstring_class = Class.new(String)
    customstring = customstring_class.new("blah")

    valid = OneOf[customstring_class, NilClass].valid?(customstring)

    assert valid == true
  end

  it "returns false when #valid? invoked with object of no type in #[]" do
    valid = OneOf[String, NilClass].valid?(123)

    assert valid == false
  end

  it "returns true when #valid? invoked with object of nested Type" do
    string_nil = OneOf[String, NilClass]

    valid = OneOf[Numeric, string_nil].valid?("test")

    assert valid == true
  end
end
