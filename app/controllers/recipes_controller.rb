class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipes = Recipe.fetched.blank? ? Recipe.all : Recipe.fetched
    @recipe = @recipes.find { |r|  r.id == params[:id] }
  end

end
