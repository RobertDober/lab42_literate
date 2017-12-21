RSpec.describe Lab42::Literate::ExampleDoctest, type: :literate do
  
  context 'group doctest' do 
    doctest fixtures_path( 'group_doctest' )
  end

  context 'empty block' do
    doctest fixtures_path( 'empty' )
  end

end
