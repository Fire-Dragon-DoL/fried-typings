lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "fried/typings/version"

Gem::Specification.new do |spec|
  spec.name          = "fried-typings"
  spec.version       = Fried::Typings::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]

  spec.summary       = %q{Composable type-safety checks}
  spec.description   = %q{Composable type-safety checks}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/fried-typings"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = "~> 2.4.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry-byebug"

  spec.add_runtime_dependency "fried-core", ">= 0.1.0"
end
