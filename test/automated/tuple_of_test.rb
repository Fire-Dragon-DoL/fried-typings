require "test_helper"
require "fried/typings/tuple_of"

class TupleOfTest < Minitest::Spec
  TupleOf = Fried::Typings::TupleOf

  it "returns true when #valid? invoked with empty array and empty types" do
    valid = TupleOf[].valid?([])

    assert valid == true
  end

  it "returns true when #valid? invoked with array all matching types" do
    valid = TupleOf[String, Numeric, NilClass].valid?(["test", 123, nil])

    assert valid == true
  end

  it "returns false when #valid? invoked with array not matching all types" do
    valid = TupleOf[String, NilClass].valid?([123, nil])

    assert valid == false
  end
end
