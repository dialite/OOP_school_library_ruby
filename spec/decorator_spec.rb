require_relative '../decorator'
require_relative '../person'

describe Decorator do
  before :each do
    @person = Person.new 1, 23, 'Raymond Zia', true
    @decorator = Decorator.new @person
  end

  it 'recieves parameters and gives a BaseDecorator object' do
    expect(@decorator).to be_an_instance_of Decorator
  end
  it 'correct_name method should return the same name as the person object' do
    expect(@decorator.correct_name).to eql 'Raymond Zia'
  end
end
