# Fried::Typings [![Build Status][test-badge]][test-link]

Composable type-safety checks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "fried-typings"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fried-typings

## Usage

Let's say you have a class `Hello` which accepts a name as argument, and you
want to ensure it's a `String`:

```ruby
require "fried/typings"

class Hello
  include Fried::Typings

  def call(name)
    Is[String].(name)

    "Hello, #{name}"
  end
end

hello = Hello.new

hello.("Francesco") # => "Hello, Francesco"
hello.(123) # => raises TypeError
```

You can nest checks too:

```ruby
one_of = OneOf[Numeric, IsStrictly[StandardError]]

one_of.(123) # => 123
one_of.(StandardError.new) # => #<StandardError: StandardError>
one_of.(ArgumentError.new) # => raises TypeError
```

And if you don't want to raise error, just use `#valid?`

```ruby
one_of = OneOf[Numeric, IsStrictly[StandardError]]

one_of.valid?(123) # => true
one_of.(ArgumentError.new) # => false
```

### Available types

- `Is[type]` checks that object `is_a?(type)`
- `IsStrictly[type]` check that `object.class == type`
- `OneOf[type1, type2, ...typeN]` checks that object pass `Is[typeN]` for
  **any** of the types
- `StrictlyOneOf[type1, type2, ...typeN]` checks that object pass
  `IsStrictly[typeN]` for **any** of the types
- `Boolean` checks that object is either `true` or `false`
- `ArrayOf[type]` checks that all element of the array pass `Is[type]`
- `HashOf[key_type, value_type]` checks that all pairs of hash pass
  `Is[key_type]` and `Is[value_type]`
- `EnumeratorOf[type]` checks that all element of the enumerator pass
  `Is[type]`
- `TupleOf[type1, type2, ...typeN]` checks that each object of the array
  passes `Is[typeN]` the type at the same index in `[]`. If array size differ
  from the amount of specified types, it doesn't pass. E.g.:
  `TupleOf[String, Numeric].valid?(["test", 123]) # => true`. While
  `TupleOf[String, Numeric].valid?([nil, 123]) # => false`. Finally,
  `TupleOf[String].valid?(["test", 123]) # => false` because array size don't
  match

### Custom types

You can build easily your custom types:

```ruby
class Is
  include MetaType
  include Type

  def initialize(type)
    @type = type
  end

  def valid?(obj)
    # If it's one of the `Type` from Fried::Typings, check with those, to
    # allow chaining/nesting
    return type.valid?(obj) if @type < Type

    # Otherwise perform the check how we would do
    obj.is_a?(@type)
  end
end
```

This will allow the following usage:

And yes this is _exactly_ how `Is` is implemented. However, it deserves some
explaination.

`Type` does all the heavy lifting. You would need only that. `MetaType` adds
a class method `[]` that delegates directly to `new`.
You don't need `MetaType`, it's just there to improve syntax.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Fire-Dragon-DoL/fried-typings.

[test-badge]: https://travis-ci.org/Fire-Dragon-DoL/fried-typings.svg?branch=master
[test-link]: https://travis-ci.org/Fire-Dragon-DoL/fried-typings
