require "forwardable"
require "fried/core"

module Fried::Typings
  # Protocol to validate object type
  module Type
    def self.included(klass)
      klass.instance_eval do
        include Comparable
      end
    end

    def <=>(other)
      self.class <=> other
    end

    # @param obj any object
    # @return the passed object
    # @raise [TypeError] should be raised if {#valid?} is false
    def call(obj)
      invalid_type!(obj) unless valid?(obj)
      obj
    end

    # @param obj any object
    # @return [Boolean] true if object is of valid type
    def valid?(obj)
      raise NotImplementedError
    end

    protected

    def invalid_type!(obj)
      raise TypeError, "Type of `obj` is #{obj.class} - #{obj.inspect}"
    end
  end
end
