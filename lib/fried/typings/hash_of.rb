require "fried/core"
require "fried/typings/enumerator_of"
require "fried/typings/meta_type"
require "fried/typings/tuple_of"

module Fried::Typings
  class HashOf
    include MetaType

    class << self
      def [](key_type, value_type)
        EnumeratorOf[TupleOf[key_type, value_type]]
      end
    end
  end
end
