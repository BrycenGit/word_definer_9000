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
      word3 = Word.new({:word => 'hello', :id => 1})
      expect(word1).to(eq(word3))
    end
  end
  
  describe('#save') do
    it('Words.all will have word 1 in an array') do
      word1 = Word.new(@att)
      word1.save
      expect(Word.all).to(eq([word1]))
    end
  end
  
  describe('.find') do
    it('will match a word by its id') do
      word1 = Word.new(@att)
      word2= Word.new({:word => 'hello', :id => nil})
      word1.save
      word2.save
      expect(Word.find(1)).to(eq(word1))
    end
  end

  describe('#delete') do
    it('it will delete a word') do
      word1 = Word.new(@att)
      word2= Word.new({:word => 'hello', :id => nil})
      word1.save
      word2.save
      word1.delete
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('#update') do
    it('it will change the word to a new word') do
      word1 = Word.new(@att)
      word1.save
      word1.update('goodbye')
      expect(word1.word).to(eq('goodbye'))
    end
  end



end