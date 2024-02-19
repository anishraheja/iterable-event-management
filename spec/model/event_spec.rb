require 'rails_helper'

RSpec.describe Event, type: :model do

  context 'validation test' do
    it 'ensures name presence' do
      event = Event.new(event_code: 'EVECODE', event_type: :event_a).save
      expect(event).to eq(false)
    end
    
    it 'ensures event_code presence' do
      event = Event.new(name: 'name', event_type: :event_a).save
      expect(event).to eq(false)
    end

    it 'ensures event_type presence' do
      event = Event.new(name: 'name', event_code: 'EVECODE').save
      expect(event).to eq(false)
    end

    it 'ensures event_type can have only two values' do
      expect {
        Event.new(name: 'name', event_code: 'EVECODE', event_type: :event_c)
      }.to raise_error(ArgumentError)
    end
  end
end
