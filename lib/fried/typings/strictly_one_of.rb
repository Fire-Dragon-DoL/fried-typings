require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"

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
      missing_type! if types.empty?
    end

    def valid?(obj)
      types.any? do |type|
        strictly_matches?(type, obj)
      end
    end

    private

    def strictly_matches?(type, obj)
      return type.valid?(obj) if type < Type

      obj.class == type
    end
  end
end
