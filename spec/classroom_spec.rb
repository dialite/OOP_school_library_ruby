require_relative '../classroom'

describe Classroom do
  context 'It should create book and add rentals' do
    classroom = Classroom.new('PostGate')

    it 'create a new Classroom' do
        expect(classroom ).to be_an_instance_of Classroom
      end

    it 'Should create a classroom' do
      expect(classroom.label).to eq 'PostGate'
    end
  end
end