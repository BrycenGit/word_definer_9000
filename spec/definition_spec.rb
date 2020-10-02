require 'rspec'
require 'definition'

describe('Definition') do
  
  before(:each) do
    @att = {:def => 'something super cool', :word_id => 1, :id => nil}
    Definition.clear
  end

  describe('.all') do
    it('will show an array of all defitions') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do
    it('definition will be equal if name, id, and word_id are the same') do
      def1 = Definition.new({:def => 'something super cool', :word_id => 1, :id => 1})
      def2 = Definition.new({:def => 'something super cool', :word_id => 1, :id => 1})
      expect(def1).to(eq(def2))
    end
  end

  describe('#save') do
    it('Definition.all will have 1 def in it') do
      def1 = Definition.new(@att)
      def1.save
      expect(Definition.all).to(eq([def1]))
    end
  end

  describe('.find') do
    it('will find def by its id') do
      def1 = Definition.new(@att)
      def1.save
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end

  describe('#delete') do
    it('it will delete a definition') do
      def1 = Definition.new(@att)
      def2= Definition.new({:def => 'new cool stuff', :word_id => 1, :id => nil})
      def1.save
      def2.save
      def1.delete
      expect(Definition.all).to(eq([word2]))
    end
  end

end