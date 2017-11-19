require "test_helper"
require "fried/typings/is"
require "fried/typings/one_of"

class IsTest < Minitest::Spec
  Is = Fried::Typings::Is
  OneOf = Fried::Typings::OneOf

  it "builds an object of type OneOf" do
    one_of = Is[String]

    assert one_of.class == OneOf
  end
end
