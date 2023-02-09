require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'age' => @age,
      'name' => @name,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission,
      'id' => @id
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['age'], object['name'], object['specialization'])
  end
end
