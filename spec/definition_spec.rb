require 'rspec'
require 'definition'

describe('Definition') do
  
  before(:each) do
    @att = {:def => 'something super cool', :word_id => 1, :id => nil}
    Definition.clear
  end

  describe('.all') do
    it('will show an array of all defitions') do
      expect(Definition.all).to(eq(['hello']))
    end
  end
end