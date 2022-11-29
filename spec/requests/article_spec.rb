require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /index" do

    it 'should return a paginated list of articles'
    it 'should return the correct page of articles'
  end
end
