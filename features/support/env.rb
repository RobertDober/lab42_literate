unless ENV["NO_RCOV"]
  require 'simplecov'
  SimpleCov.start
end

PROJECT_HOME = File.expand_path('../../..', __FILE__)

def spec_path file
  File.join(PROJECT_HOME, 'spec', file.sub(%r{(?:_spec\.rb)?\z}, '_spec.rb'))
end
