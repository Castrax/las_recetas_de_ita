class PagesController < ApplicationController
  def home
    @recipes = Recipe.order("created_at").reverse_order.limit(3)
  end

  def profile
    @user = current_user
    @recipes = current_user.recipes
  end
end
