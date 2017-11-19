require "test_helper"
require "fried/typings/meta_type"

class MetaTypeTest < Minitest::Spec
  def setup
    @meta_type = Class.new { include Fried::Typings::MetaType }
  end

  it "delegates .[] to .new" do
    obj = @meta_type[]

    assert obj.is_a?(@meta_type)
  end

  it "has a method to raise if no type supplied" do
    obj = @meta_type[]
    def obj.trigger_missing_type!
      missing_type!
    end

    assert_raises Fried::Typings::MetaType::MissingTypeError do
      obj.trigger_missing_type!
    end
  end
end
