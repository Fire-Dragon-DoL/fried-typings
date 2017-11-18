require "fried/typings/version"

module Fried
  module Typings
    # HashOfParams = HashOf[Symbol, Is[String, NilClass]]

    # attribute :bar, Is[Number]
    # attribute :foo, IsStrictly[String]
    # attribute :bar, EnumeratorOf[Symbol]
    # attribute :bar, ArrayOf[Number]
    # attribute :bar, HashOfParams
  end
end
