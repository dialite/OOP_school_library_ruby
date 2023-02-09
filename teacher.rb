require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :id

  def initialize(id, age, specialization, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
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
      'id' => @id,
    }.to_json(*args)
  end

  def self.create_json(object)
    new(object['age'], object['name'], object['specialization'], object['parent_permission'], object['id'])
  end
end
