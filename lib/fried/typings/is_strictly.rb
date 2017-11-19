require "fried/core"
require "fried/typings/meta_type"
require "fried/typings/type"

module Fried::Typings
  # Checks if the object.class is exactly of the passed type
  class IsStrictly
    include MetaType
    include Type

    private

    attr_reader :type

    public

    def initialize(type)
      @type = type
    end

    def valid?(obj)
      return type.valid?(obj) if type < Type

      obj.class == type
    end
  end
end
