class ArticlesController < ApplicationController

  helper_method :pluralise_likes

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

  def like
    @article = Article.find( params[:article_id] )
    @article.reaction.update( likes: @article.reaction.likes + 1 )
    redirect_to( articles_url page: params[:page], anchor: "article-#{@article.id}" )
  end

  def pluralise_likes( number )
    case number
      when 0 then 'No likes yet'
      when 1 then '1 like'
      else "#{number} likes"
    end
  end
end
