module Support
  module Fixtures
    def fixtures_path *segments
      interm = File.join(PROJECT_ROOT, 'spec', 'fixtures', *segments.flatten)
      interm.sub(%r{(?:\.md)?\z}, '.md')
    end
  end
end

RSpec.configure do |conf|
  conf.include Support::Fixtures, type: :literate
  conf.extend Support::Fixtures, type: :literate
end
