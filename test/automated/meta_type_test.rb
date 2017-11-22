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
end
