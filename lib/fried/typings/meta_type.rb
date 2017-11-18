require "forwardable"
require "fried/core"

module Fried::Typings
  # Protocol to generate {Type}
  module MetaType
    MissingTypeError = Class.new(StandardError)

    def self.included(klass)
      klass.instance_eval do
        class << self
          extend Forwardable

          # @!method []
            # @param args [Array<Class, Module, Type>]
            # @return [Type]
          def_delegator :self, :new, :[]
        end
      end
    end

    protected

    def missing_type!
      raise MissingTypeError, "No type(s) configured for the meta type"
    end
  end
end
