require_relative '../trimmer_decorator'
require_relative '../person'

describe Decorator do
  before :each do
    @person = Person.new 13, 34, 'Raymond Zia', true
    @trimmer_decorator = TrimmerDecorator.new @person
  end
  it 'recieves parameters and gives a BaseDecorator object' do
    expect(@trimmer_decorator).to be_an_instance_of TrimmerDecorator
  end
  it 'correct_name method should return the same name as the person object' do
    expect(@trimmer_decorator.correct_name).to eql 'Raymond Zi'
  end
end