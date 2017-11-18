require "minitest/spec"
require "pry-byebug"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new
