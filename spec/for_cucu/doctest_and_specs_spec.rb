RSpec.describe 'doctest_and_specs', type: :literate do

  doctest fixtures_path('doctest_and_specs')


  describe 'other specs' do
    it 'succeeds' do
      expect( 42 ).not_to be_zero
    end

    it 'fails' do
      expect( 43 ).to be_zero
    end
  end
  
end
