RSpec.describe Lab42::Literate::ExampleDoctest, type: :literate do
  
  let( :wrapper ){ Object.new.extend described_class }

  let( :file ){ fixtures_path 'example_doctest' }

  it 'executes the literate block' do
    doctest file
    expect( @alpha ).to eq('alpha')
  end


end
