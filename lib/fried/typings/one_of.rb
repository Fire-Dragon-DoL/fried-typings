require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"
require "fried/typings/is"

module Fried::Typings
  # Checks if the object {#is_a?} object of the passed types
  class OneOf
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
        Is[type].valid?(obj)
      end
    end
  end
end
