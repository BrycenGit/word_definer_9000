require 'rspec'
require 'word'

describe('Word') do
  before(:each) do
    Word.clear
    att = {:word => 'hello', :id => nil}
  end

  describe('.all') do
    it('will show an array of the values from @@words') do
      expect(Word.all).to(eq([hello]))
    end
  end
end