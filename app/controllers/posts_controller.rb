class PostsController < ApplicationController

  before_action :require_login, only: [:new, :create]

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
      @post.user = current_user
      @post.vote = 1
      if @post.save!
         tag_names = params[:post][:tag_names].split(",")
         tag_names = tag_names.collect(&:strip)
         tag_names.each do |name|
           @post.tags << Tag.find_or_initialize_by(body: name)
         end
        flash[:success] = "Your post is posted!"
        redirect_to root_path
      else
        render :new
      end
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
      params.require(:post).permit(:vote, :title, :link, :summary, :user_id)
    end

end
