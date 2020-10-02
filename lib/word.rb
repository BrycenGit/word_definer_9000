
class Word

  attr_accessor :word, :id

  @@words = {}
  @@rows = 0
  
  def initialize(att)
    @word = att.fetch(:word)
    @id = att.fetch(:id) || @@rows += 1
  end

  def self.clear
    @@words = {}
    @@rows = 0
  end

   def self.all
    @@words.values
   end

   def ==(param)
    self.word == param.word && self.id == param.id
   end

   def save
    @@words[self.id] = Word.new({:word => self.word, :id => self.id})
   end

   def self.find(id)
    @@words[id]
   end

   def delete
    @@words.delete(self.id)
   end

   def update(word)
    self.word=(word)
   end
end
