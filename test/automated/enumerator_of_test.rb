require "test_helper"
require "fried/typings/one_of"
require "fried/typings/enumerator_of"

class EnumeratorOfTest < Minitest::Spec
  EnumeratorOf = Fried::Typings::EnumeratorOf
  OneOf = Fried::Typings::OneOf

  it "returns true when #valid? invoked with objects of type in #[]" do
    valid = EnumeratorOf[String].valid?(["test", "foo"])

    assert valid == true
  end

  it "returns true when #valid? invoked with objects of subtype in #[]" do
    customstring_class = Class.new(String)
    str1 = customstring_class.new("blah")
    str2 = customstring_class.new("foo")

    valid = EnumeratorOf[String].valid?([str1, str2])

    assert valid == true
  end

  it "returns false when #valid? invoked with not all objects matching type" do
    valid = EnumeratorOf[String].valid?(["test", 123])

    assert valid == false
  end

  it "returns true when #valid? invoked with objects of nested Type" do
    valid = EnumeratorOf[OneOf[String, Numeric]].valid?(["test", 123])

    assert valid == true
  end
end
