RSpec.describe 'doctest with setup', type: :literate do
  let( :foo ){ 'foo' }

  doctest fixtures_path('doctest_with_setup')

end
