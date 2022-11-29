require 'rails_helper'
require_relative '../helpers'

# include helper methods for loading the test data
RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Photo, type: :model do
  describe '#initialize' do

    let(:data)    { test_article['photos'].first }
    let(:subject) { Photo.new().with_data(data) }

    it 'updates the Avatar with the correct JSON data' do
      expect(subject.uid).to eq(data['uid'])
      expect(subject.original_url).to eq(data['files']['original'])
      expect(subject.large_url).to eq(data['files']['large'])
      expect(subject.medium_url).to eq(data['files']['medium'])
      expect(subject.small_url).to eq(data['files']['small'])
      expect(subject.width).to eq(data['dimensions']['width'])
      expect(subject.height).to eq(data['dimensions']['height'])
    end
  end
end
