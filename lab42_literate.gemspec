$:.unshift( File.expand_path( "../lib", __FILE__ ) )
require 'lab42/literate/version'
version = Lab42::Literate::VERSION
Gem::Specification.new do |s|
  s.name        = 'lab42_literate'
  s.version     = version
  s.summary     = 'Literate Programming à la doctest with RSpec'
  s.description = %{Spec behavior in any file load it with doctest from an RSpec example group} 
  s.authors     = ["Robert Dober"]
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb")
  s.files      += %w{LICENSE README.md}
  s.homepage    = "https://github.com/RobertDober/lab42_literate"
  s.licenses    = %w{Apache 2}

  s.required_ruby_version = '>= 2.3.1'
  s.add_dependency 'rspec', '~> 3.7'

  s.add_development_dependency 'cucumber', '~> 3.1' 
  s.add_development_dependency 'aruba', '~> 0.14.3' 
  s.add_development_dependency 'pry', '~> 0.11'
  s.add_development_dependency 'pry-byebug', '~> 3.5'

  s.add_development_dependency 'simplecov', '~> 0.15'
  s.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'

  s.add_development_dependency 'travis-lint', '~> 2.0'
  # s.add_development_dependency 'rake', '~> 10.3'
end
