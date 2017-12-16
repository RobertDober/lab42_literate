module Lab42
  module Literate
    require_relative 'literate/example_doctest'
    require_relative 'literate/group_doctest'
  end
end

begin
  RSpec.configure do | conf |
    conf.extend Lab42::Literate::GroupDoctest, type: :literate
    conf.include Lab42::Literate::ExampleDoctest, type: :literate
  end
rescue NameError
  raise RuntimeError, 'this file must be required inside RSpec only'
end

