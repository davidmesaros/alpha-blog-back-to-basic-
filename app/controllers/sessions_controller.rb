class SessionsController < ApplicationController
  def new

  end

  def create

    email =  User.find_by(email: params[:sessions][:email].downcase)
    # debugger
    if email
    # if email && email.authenticate(params[:sessions][:password_digest])
    session[:user_id] = email.id
    flash[:success] = "You have SUCCESSFULL SIGN IN BUD :)"
    redirect_to user_path(email) 
    else
      flash.now[:danger] = "there was something worng with your email or password"
      render 'new'
    end
  end
  def destroy
    session[:user_id]  = nil
    flash[:success] = "You have Logged out"
    redirect_to root_path
  end
end