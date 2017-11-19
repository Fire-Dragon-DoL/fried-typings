require "test_helper"
require "fried/typings/type"

class TypeTest < Minitest::Spec
  def setup
    @type = Class.new { include Fried::Typings::Type }
  end

  def build_type
    @type.new
  end

  it "compares to nil when own class is not related to other" do
    type = build_type

    comparison = type <=> String

    assert comparison.nil?
  end

  it "compares to 0 when own class equals to other" do
    type = build_type

    comparison = type <=> @type

    assert comparison == 0
  end

  it "raises NotImplementedError when calling #valid?" do
    type = build_type

    assert_raises NotImplementedError do
      type.valid?(123)
    end
  end

  it "raises TypeError when #valid? is false" do
    type = build_type
    def type.valid?(obj)
      false
    end

    assert_raises TypeError do
      type.(123)
    end
  end

  it "returns the passed object when #valid? is true" do
    type = build_type
    def type.valid?(obj)
      true
    end

    obj = type.(123)

    assert obj == 123
  end

  it "has a method to raise TypeError" do
    type = build_type
    def type.trigger_invalid_type!(obj)
      invalid_type!(obj)
    end

    assert_raises TypeError do
      type.trigger_invalid_type!(123)
    end
  end
end
