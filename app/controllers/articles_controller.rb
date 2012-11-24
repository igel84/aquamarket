class ArticlesController < ApplicationController
  def show
    if params[:hiperlink] 
      @article = Article.find_by_title params[:hiperlink]
    else
      @article = Article.find params[:id]
    end
  end
end
