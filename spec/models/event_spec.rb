require 'rails_helper'
require 'spec_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it "Should only save if there is a date" do
      e = Event.new(creator_id: 1, description: 'Event 1')
      expect(e.save).to eq(false)
    end

    it "Should note save descriptions with more than 300 characters" do
      bigstr = ''
      301.times { |i| bigstr + 'str '}
      e = Event.new(creator_id: 1, date: '2020-05-20', description: bigstr)
      expect(e.save).to eq(false)
    end
  end

  context 'Association tests' do
    it { should belong_to(:creator) }
    it { should have_many(:invitations) }
    it { should have_many(:attendees) }
  end
end
