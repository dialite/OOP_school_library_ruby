require_relative '../student'
require_relative '../person'

describe Student do
  context 'When providing student information' do
    student = Student.new 10, 22, 'grade 5', 'James Brown', true

    it 'create a new student' do
      expect(student).to be_an_instance_of Student
    end

    it 'the student can have permission to use the service' do
      expect(student.can_use_services?).to eq true
    end

    it 'name of student should be James Brown' do
      expect(student.name).to eq 'James Brown'
    end

    it "Add classroom 'grade 5'" do
      expect(student.classroom).to eql 'grade 5'
    end
  end
end
