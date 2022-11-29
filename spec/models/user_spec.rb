require 'rails_helper'
require_relative '../helpers'

# include helper methods for loading the test data
RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe User, type: :model do
  describe '#initialize' do

    let(:data)    { test_article['user'] }
    let(:subject) { User.new().with_data(data) }

    it 'updates the User with the correct JSON data' do
      expect(subject.first_name).to eq(data['first_name'])

      expect(subject.avatar.original_url).to eq(data['current_avatar']['original'])
      expect(subject.avatar.large_url).to eq(data['current_avatar']['large'])
      expect(subject.avatar.small_url).to eq(data['current_avatar']['small'])

      # TODO: pluck isn't working - su'in ain't right
      #expect(subject.roles.pluck(:name)).to eq(data['roles'])
      expect(subject.roles.map(&:name)).to eq(data['roles'])

      expect(subject.latitude).to eq(data['location']['latitude'])
      expect(subject.longitude).to eq(data['location']['longitude'])

      expect(subject.rating).to eq(data['rating']['rating'])
      expect(subject.number).to eq(data['rating']['number'])
    end
  end
end
