class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.json
      end
    else
      render recipe_path(@comment.recipe.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id]) 
    if @comment.destroy
      render :index 
    end
  end
  private

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end



#   private
#   def comment_params
#     params.require(:comment).permit(:text).merge(user_id: current_user.id, product_id: params[:product_id])
#   end
# end