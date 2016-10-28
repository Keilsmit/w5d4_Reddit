class PostsController < ApplicationController


    def index
      @posts = Post.order(vote: :desc)
    end

    def show
      @post = Post.find(params[:id])
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      @post.user = params[:post][:user]
      @post.link = params[:post][:link]
      @post.summary = params[:post][:summary]
      @post.vote =1

      @post.save
      redirect_to root_path
    end

    def update
      @post = Post.find(params[:id])

      @post = Post.new(post_params)
      @post.user = params[:post][:user]
      @post.link = params[:post][:link]
      @post.vote +=1

      @post.save
      redirect_to root_path
    end


    def upvote
      @post = Post.find(params[:id])
      @post.vote +=1
      @post.save
      redirect_to root_path
    end


    def downvote
      @post = Post.find(params[:id])
      @post.vote -=1
      @post.save
      redirect_to root_path
    end

    def title_vote
      @post = Post.find(params[:id])
      @post.vote +=1
      @post.save
      redirect_to @post.link
    end

    def summary
      @post = Post.find(params[:id])
    end




  private

    def post_params
      params.require(:post).permit(:vote, :Title)
    end

end
