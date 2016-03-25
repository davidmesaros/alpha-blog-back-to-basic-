class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    # debugger
    @create_user = User.new(user_params)
    # debugger
    if @create_user.save
      flash[:success] = "You have signed up => congrat #{@create_user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end

end