require "test_helper"
require "fried/typings/nothing"

class NothingTest < Minitest::Spec
  Nothing = Fried::Typings::Nothing

  it "doesn't matche any object" do
    assert Nothing.valid?(Object.new) == false
  end

  it "raises with any object" do
    assert_raises TypeError do
      Nothing.(Object.new)
    end
  end
end
