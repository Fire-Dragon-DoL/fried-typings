require "fried/typings/version"
require "fried/typings/type"
require "fried/typings/meta_type"
require "fried/typings/is"
require "fried/typings/one_of"
require "fried/typings/boolean"

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
