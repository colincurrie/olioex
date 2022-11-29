class ArticlesController < ApplicationController

  def index
    self.articles = Article.all
  end
end
