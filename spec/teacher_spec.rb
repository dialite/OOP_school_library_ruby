require_relative '../teacher'
require 'json'

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

    it 'Create json from Book object' do
      teacher_json = teacher.to_json
      expect(teacher_json).to eql '{"json_class":"Teacher","age":22,"name":"unknown","specialization":"Math","parent_permission":true,"id":"unknown"}'
    end
  end
end
