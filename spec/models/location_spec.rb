require 'rails_helper'
require_relative '../helpers'

# include helper methods for loading the test data
RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Location, type: :model do
  describe '#with_data' do

    let(:data)    { test_article['location'] }
    let(:subject) { Location.new(data) }

    it 'updates the Avatar with the correct JSON data' do
      expect(subject.latitude).to eq(data['latitude'])
      expect(subject.longitude).to eq(data['longitude'])
      expect(subject.distance).to eq(data['distance'])
      expect(subject.town).to eq(data['town'])
      expect(subject.country).to eq(data['country'])
    end
  end
end
