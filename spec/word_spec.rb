require 'rspec'
require 'word'

describe('Word') do
  before(:each) do
    Word.clear
    @att = {:word => 'hello', :id => nil}
  end

  describe('.all') do
    it('will show an array of the values from @@words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it('word1 will be equal to word3') do
      word1 = Word.new(@att)
      word3 = Word.new({:word => 'hello', :id => nil})
      expect(word1).to(eq(word3))
    end
  end
end