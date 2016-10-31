class SessionsController < ApplicationController


  def new
  end

  def create
    user = User.find_by(
                  username: params[:session][:username]
                )
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to :root
      else
        flash[:warning] = "Your password does not match."
        render :new
      end
    else
      flash[:warning] = "No user has that name."
      render :new
    end
  end





end
