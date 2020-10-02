
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
end
