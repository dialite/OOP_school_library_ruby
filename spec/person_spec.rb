require_relative '../person'

describe Person do
  before :each do
    @person = Person.new 1, 15, 'Kennedy', true
  end
  context 'When creating person' do
    it 'create a person information' do
      expect(@person).to be_an_instance_of Person
    end
    it "can_use_services when parent permission == true" do
      expect(@person.can_use_services?).to eql true
    end
    it "Name should be 'Kennedy'" do
      expect(@person.name).to eql 'Kennedy'
    end
  end
end

