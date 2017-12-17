require 'simplecov'
PROJECT_HOME = File.expand_path('../../..', __FILE__)
SimpleCov.start do
  SimpleCov.root(PROJECT_HOME)
  track_files "lib/**/*.rb"
end

