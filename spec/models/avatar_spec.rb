require 'rails_helper'
require_relative '../helpers'

# include helper methods for loading the test data
RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Avatar, type: :model do
  describe '#with_data' do

    let(:user)    { create(:user) }
    let(:data)    { test_article['user']['current_avatar'].merge( 'user' => user ) }
    let(:subject) { Avatar.new().with_data(data) }

    it 'updates the Avatar with the correct JSON data' do
      expect(subject.original_url).to eq(data['original'])
      expect(subject.large_url).to eq(data['large'])
      expect(subject.small_url).to eq(data['small'])
    end
  end
end
