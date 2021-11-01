class RecipesController < ApplicationController

  def index
    @recipes = helpers.contentful.entries(content_type:'recipe', include: 2)
  end

  def show
    @recipes = helpers.contentful.entries(content_type:'recipe', include: 2)
    @recipe = @recipes.find { |r|  r.id == params[:id] }
  end

end
