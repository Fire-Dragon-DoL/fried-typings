require "test_helper"
require "fried/typings/hash_of"

class HashOfTest < Minitest::Spec
  HashOf = Fried::Typings::HashOf

  it "returns true when #valid? invoked with hash of type in #[]" do
    valid = HashOf[Numeric, String].valid?({ 123 => "test" })

    assert valid == true
  end

  it "returns false when #valid? invoked with hash not of type in #[]" do
    valid = HashOf[Numeric, String].valid?({ foo: "test" })

    assert valid == false
  end
end
