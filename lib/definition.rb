class Definition

  attr_accessor :def, :word_id, :id

  @@definitions = {}
  @@rows = 0
 
  def initialize(att)
    @def = att.fetch(:def)
    @word_id = att.fetch(:word_id)
    @id = att.fetch(:id) || @@rows +=1
  end

  def self.clear
    @@definitions = {}
    @@rows = 0
  end

  def self.all
    @@definitions.values
  end

  def ==(param)
    self.id == param.id && self.def == param.def && self.id == param.id
  end

  def save
    @@definitions[self.id] = Definition.new({:def => self.def, :word_id => self.word_id, :id => self.id})
  end

  def self.find(id)
    @@definitions[id]
  end
end


  