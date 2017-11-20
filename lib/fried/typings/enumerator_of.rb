require "fried/core"
require "fried/typings/type"
require "fried/typings/meta_type"
require "fried/typings/is"

module Fried::Typings
  # Checks if all enumerated objects {Is} of passed type
  class EnumeratorOf
    include MetaType
    include Type

    private

    attr_reader :type

    public

    def initialize(type)
      @type = type
    end

    # Notice that the method will actually iterate over the enumerator
    # @param enumerator [Enumerator]
    def valid?(enumerator)
      return false unless Is[Enumerator].valid?(enumerator)

      enumerator.all? { |obj| Is[type].valid?(obj) }
    end
  end
end
