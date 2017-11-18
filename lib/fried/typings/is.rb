require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"

module Fried::Typings
  # Checks if the object {#is_a?} object of the passed type
  class Is
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
        matches?(type, obj)
      end
    end

    private

    def matches?(type, obj)
      if type < Type
        type.valid?(obj)
      else
        obj.is_a?(type)
      end
    end
  end
end
