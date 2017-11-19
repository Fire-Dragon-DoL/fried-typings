require "fried/core"
require "fried/typings/meta_type"
require "fried/typings/one_of"

module Fried::Typings
  # Checks if the object {#is_a?} object of the passed type
  class Is
    include MetaType

    class << self
      def [](type)
        OneOf[type]
      end
    end
  end
end
