require "forwardable"
require "fried/core"
require "fried/typings/type"

module Fried::Typings
  # Matches any object
  anything = Class.new do
    include Type

    # @param obj any object
    def valid?(obj)
      true
    end
  end
  Anything = anything.new
end
