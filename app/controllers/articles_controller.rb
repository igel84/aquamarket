class ArticlesController < ApplicationController
  def show
    if params[:hiperlink] 
      @article = Article.find_by_title params[:hiperlink]
    elsif params[:id]
      @article = Article.find params[:id]
    else
      @article = Article.first
    end

    @article = Article.first if @article == nil

  end
end
