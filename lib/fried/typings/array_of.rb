require "fried/core"
require "fried/typings/is"
require "fried/typings/enumerator_of"
require "fried/typings/meta_type"
require "fried/typings/type"

module Fried::Typings
  # Checks if all elements of the array match given type
  class ArrayOf
    include MetaType
    include Type

    private

    attr_reader :type

    public

    def initialize(type)
      @type = type
    end

    # @param ary [Array]
    def valid?(ary)
      return false unless Is[Array].valid?(ary)

      enumerator = ary.each

      EnumeratorOf[type].valid?(enumerator)
    end
  end
end
