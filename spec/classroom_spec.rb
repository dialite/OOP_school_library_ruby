require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'It should create book and add rentals' do
    classroom = Classroom.new('PostGate')
    student = Student.new 10, 22, 'grade 5', 'James Brown', true

    it 'create a new Classroom' do
      expect(classroom).to be_an_instance_of Classroom
    end

    it 'Should create a classroom' do
      expect(classroom.label).to eq 'PostGate'
    end

    it 'Add Student should add object into students array be of length 1' do
      classroom.add_student(student)
      expect(classroom.students.length).to eql 1
    end
  end
end
