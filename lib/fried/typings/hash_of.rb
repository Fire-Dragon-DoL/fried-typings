require "fried/core"
require "fried/typings/enumerator_of"
require "fried/typings/is"
require "fried/typings/meta_type"
require "fried/typings/tuple_of"
require "fried/typings/type"

module Fried::Typings
  # Checks if all key => value elements of the hashmap match the types pair
  class HashOf
    include MetaType
    include Type

    private

    attr_reader :key_type
    attr_reader :value_type

    public

    def initialize(key_type, value_type)
      @key_type = key_type
      @value_type = value_type
    end

    # @param hsh [Hash]
    def valid?(hsh)
      return false unless Is[Hash].valid?(hsh)

      enumerator = hsh.each

      EnumeratorOf[TupleOf[key_type, value_type]].valid?(enumerator)
    end
  end
end
