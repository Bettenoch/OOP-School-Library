require 'rspec'
require_relative '../person'
require_relative '../capitalize_decorator'

describe CapitalizeDecorator do
  before do
    @person = Person.new(23, 'qaisar abbas')
    @capitalize_person = CapitalizeDecorator.new(@person).correct_name
  end

  context 'Test capitalize decorator' do
    it 'should capitalize the first name' do
      expect(@capitalize_person).to eq 'Qaisar abbas'
    end
  end
end
