require 'rails_helper'
require_relative '../helpers'

# include helper methods for loading the test data
RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Article, type: :model do
  describe '#initialize' do

    let(:subject) { Article.new().with_data(test_article) }

    it 'creates the Article with the correct JSON data' do
      expect(subject.title).to eq(test_article['title'])
      expect(subject.description).to eq(test_article['description'])
      expect(subject.donation_description).to eq(test_article['donation_description'])
      expect(subject.section).to eq(test_article['section'])
      expect(subject.collection_notes).to eq(test_article['collection_notes'])
      expect(subject.status).to eq(test_article['status'])
      expect(subject.expiry).to eq(test_article['expiry'])
      expect(subject.is_owner).to eq(test_article['is_owner'])
      expect(subject.last_listed).to eq(test_article['last_listed'])
    end
  end
end
