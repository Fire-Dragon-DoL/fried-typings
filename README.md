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


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Fire-Dragon-DoL/fried-typings.

[test-badge]: https://travis-ci.org/Fire-Dragon-DoL/fried-typings.svg?branch=master
[test-link]: https://travis-ci.org/Fire-Dragon-DoL/fried-typings
