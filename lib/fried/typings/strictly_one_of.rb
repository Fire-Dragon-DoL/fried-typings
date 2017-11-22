require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"
require "fried/typings/is_strictly"

module Fried::Typings
  # Checks if the object.class is exactly one of the passed types
  class StrictlyOneOf
    include MetaType
    include Type

    private

    attr_reader :types

    public

    def initialize(*types)
      @types = types
    end

    def valid?(obj)
      types.any? do |type|
        IsStrictly[type].valid?(obj)
      end
    end
  end
end
