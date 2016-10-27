class PostsController < ApplicationController


    def index
      @post = Post.all
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
      @post.vote +=1

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


  private

    def post_params
      params.require(:post).permit(:vote, :Title)
    end

end