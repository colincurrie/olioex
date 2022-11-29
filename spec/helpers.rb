module Helpers
  def test_data
    JSON.parse( File.read( 'spec/data/test-articles-v4.json' ) )
  end

  def test_article
    test_data.first
  end
end