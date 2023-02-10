require_relative('person')

class Student < Person
  attr_accessor :id
  attr_reader :classroom

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(_id, age, classroom, name = 'unknown', parent_permission = true)
    super(id, age, name, parent_permission)
    @classroom = classroom
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_classroom(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'classroom' => @classroom,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['classroom'], object['age'], object['naem'], object['parent_permission'])
  end
end
