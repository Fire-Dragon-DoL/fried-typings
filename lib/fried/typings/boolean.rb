require "fried/core"
require "fried/typings/type"

module Fried::Typings
  # Checks if the object is {TrueClass} or {FalseClass}
  Boolean = Is[TrueClass, FalseClass]
end
