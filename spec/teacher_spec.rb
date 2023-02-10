require_relative '../teacher'

describe Teacher do
  context 'When providing teacher information' do
    teacher = Teacher.new 'unknown', 'Math', 22

    it 'create a new Teacher' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'age of Teacher should be 22' do
      expect(teacher.age).to eq 22
    end

    it 'specialization of Teacher should be Math' do
      expect(teacher.specialization).to eq 'Math'
    end

    it 'name of Teacher should be unknown' do
      expect(teacher.name).to eq 'unknown'
    end
  end
end
