class Comment < ApplicationRecord

before_action :require_login, only: [:create]

def create
  @post = Post.find(params[:post_id])
  @comment = @post.rejoiners.new(comment_params)
  @comment.user = current_user
  if @comment.save
    flash[:success] = "Consider it rejoined!"
    redirect_to @post
  else
    flash[:danger] = "That didn't save."
    redirect_to :back
  end
end


private

def comment_params
  params.require(:comment).permit(:body)
end

end
