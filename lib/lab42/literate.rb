module Lab42
  module Literate
    require_relative 'literate/example_doctest'
    require_relative 'literate/group_doctest'

    module Given
      def Given &blk
        instance_exec(&blk)
      end
    end
  end
end

RSpec.configure do | conf |
  conf.extend Lab42::Literate::GroupDoctest, type: :literate
  conf.extend Lab42::Literate::Given, type: :literate

  conf.include Lab42::Literate::ExampleDoctest, type: :literate
end
