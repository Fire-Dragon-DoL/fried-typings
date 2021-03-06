require "fried/core"
require "fried/typings/meta_type"
require "fried/typings/type"

module Fried::Typings
  # Checks if the object {#is_a?} object of the passed type
  class Is
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

      obj.is_a?(type)
    end
  end
end
