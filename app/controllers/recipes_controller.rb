class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comments = @recipe.comments
    @comment = @recipe.comments.build
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "投稿に成功しました。"
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user != current_user
        redirect_to recipes_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def time
    @recipes = Recipe.all
    @recipes.where!(time: '10分')
  end

  def time2
    @recipes = Recipe.all
    @recipes.where!(time: '20分')
  end

  def time3
    @recipes = Recipe.all
    @recipes.where!(time: '30分')
  end

  def time4
    @recipes = Recipe.all
    @recipes.where!(time: '作り置き')
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :time, :body, :image)
  end
end
