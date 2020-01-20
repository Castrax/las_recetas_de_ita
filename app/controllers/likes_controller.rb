class LikesController < ApplicationController
  before_action :find_recipe
  before_action :find_like, only: [:destroy]
  skip_after_action :verify_authorized
  def create
    if already_liked?
      flash[:notice] = "Tu as déjà liké cette recette !"
    else
      @recipe.likes.create(user_id: current_user.id)
    end
    redirect_to recipe_path(@recipe)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Tu n'as pas liké cette recette !"
    else
      @like.destroy
    end
    redirect_to recipe_path(@recipe)
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, recipe_id:
    params[:recipe_id]).exists?
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def find_like
    @like = @recipe.likes.find(params[:id])
  end
end
