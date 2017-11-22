require "test_helper"
require "fried/typings/anything"

class AnythingTest < Minitest::Spec
  Anything = Fried::Typings::Anything

  it "matches any object" do
    assert Anything.valid?(Object.new) == true
  end

  it "never raises with any object" do
    Anything.(Object.new)
  end
end
