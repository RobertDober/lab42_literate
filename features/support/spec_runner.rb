
def spec_path file
  File.join(PROJECT_HOME, 'spec', file.sub(%r{(?:_spec\.rb)?\z}, '_spec.rb'))
end
