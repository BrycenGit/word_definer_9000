class Definition

  attr_accessor :def, :word_id, :id
  attr_reader :word_id

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
    self.id == param.id && self.def == param.def
  end

  def save
    @@definitions[self.id] = Definition.new({:def => self.def, :word_id => self.word_id, :id => self.id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(param)
    self.def=(param)
  end

  def self.find_by_word(id)
    defs = []
    @@definitions.values.each do |definition|
      if definition.word_id == id
        defs.push(definition)
      end
    end
    defs
  end
end


  