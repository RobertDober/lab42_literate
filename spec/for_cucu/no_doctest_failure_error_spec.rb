RSpec.describe 'no_doctest_failure_error', literate: true do

  it { expect(false).to be_truthy }
  it { raise RuntimeError, "this is expected" }
end
