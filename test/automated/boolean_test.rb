require "test_helper"
require "fried/typings/boolean"

class BooleanTest < Minitest::Spec
  Boolean = Fried::Typings::Boolean

  it "accepts true value" do
    assert Boolean.(true) == true
  end

  it "accepts false value" do
    assert Boolean.(false) == false
  end

  it "raises with any other value" do
    assert_raises TypeError do
      Boolean.(Object.new)
    end
  end
end
