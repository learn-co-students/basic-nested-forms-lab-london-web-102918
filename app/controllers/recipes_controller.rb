class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    @recipe.ingredients.build
  end

  def create
    # raise
    Recipe.create(recipe_params)
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title,
      ingredients_attributes: [:name, :quantity]
    )
  end


# hash  = {
#   key: value
# }
#
# hash[:another_hash][:key]


  # def recipe_ingredient_params
  #   params[:recipe].require(:ingredients)
  # end

end
