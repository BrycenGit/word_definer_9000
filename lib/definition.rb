class Definition

  attr_accessor :definition, :word_id, :id

  @@definitions = {}
  @@rows = 0
 
  def initialize(att)
    @definition = att.fetch(:definition)
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
    self.id == param.id && self.definition == param.definition
  end

  def save
    @@definitions[self.id] = Definition.new({:definition => self.definition, :word_id => self.word_id, :id => self.id})
  end

  def self.find(id)
    @@definitions[id]
  end

  def delete
    @@definitions.delete(self.id)
  end

  def update(param)
    self.definition=(param)
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


  