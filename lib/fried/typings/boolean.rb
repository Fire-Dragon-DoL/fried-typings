require "fried/core"
require "fried/typings/one_of"

module Fried::Typings
  # Checks if the object is {TrueClass} or {FalseClass}
  Boolean = OneOf[TrueClass, FalseClass]
end
