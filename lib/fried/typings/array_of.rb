require "fried/core"
require "fried/typings/meta_type"
require "fried/typings/enumerator_of"

module Fried::Typings
  # @!parse
  #   # Alias for {EnumeratorOf}
  #   class ArrayOf
  #   end
  ArrayOf = EnumeratorOf
end
