require 'rspec'
require 'definition'

describe('Definition') do
  
  before(:each) do
    @att = {:definition => 'something super cool', :word_id => 1, :id => nil}
    Definition.clear
  end

  describe('.all') do
    it('will show an array of all defitions') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#==') do
    it('definition will be equal if name, id, and word_id are the same') do
      def1 = Definition.new({:definition => 'something super cool', :word_id => 1, :id => 1})
      def2 = Definition.new({:definition => 'something super cool', :word_id => 1, :id => 1})
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
      def2= Definition.new({:definition => 'new cool stuff', :word_id => 1, :id => nil})
      def1.save
      def2.save
      def1.delete
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('#update') do
    it('it will change the def to a new def') do
      def1 = Definition.new(@att)
      def1.save
      def1.update('goodbye')
      expect(def1.definition).to(eq('goodbye'))
    end
  end

  describe('.find_by_word') do
    it ('it will return an array of definitions that have a matching word id') do
      def1= Definition.new({:definition => 'new cool stuff', :word_id => 1, :id => nil})
      def2= Definition.new({:definition => 'hello', :word_id => 1, :id => nil})
      def3= Definition.new({:definition => 'hello', :word_id => 2, :id => nil})
      def1.save
      def2.save
      def3.save
      expect(Definition.find_by_word(1)).to(eq([def1, def2]))
    end
  end
end