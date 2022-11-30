class ArticlesController < ApplicationController

  def index
    source_url = ENV.fetch('SOURCE_URL','http://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json')
    data = JSON.parse(HTTParty.get(source_url).body)

    articles = data.map do |article|
      record = Article.find_or_create_by(id: article['id'])
      record.with_data(article).save
      record
    end

    @articles = Article.order(created_at: :desc).page( params[:page] )
  end
end
