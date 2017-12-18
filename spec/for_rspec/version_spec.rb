require 'lab42/literate/version'
RSpec.describe 'version' do
  it { expect(Lab42::Literate::VERSION).to match(%r{ \d+ \. \d+ \. \d+ }x) }
end

