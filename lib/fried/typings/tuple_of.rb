require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"

module Fried::Typings
  # Checks if Array fields match types specified on a 1-to-1 relationship.
  # So `[123, "test", nil]` matches `TupleOf[Numeric, String, NilClass]`
  class TupleOf
    include MetaType
    include Type

    private

    attr_reader :types

    public

    def initialize(*types)
      @types = types
    end

    def valid?(ary)
      return false unless ary.size == types.size

      types.each.with_index.all? do |type, index|
        matches?(type, ary[index])
      end
    end

    private

    def matches?(type, obj)
      return type.valid?(obj) if type < Type

      obj.is_a?(type)
    end
  end
end
