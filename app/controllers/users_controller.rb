class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show] 
  before_action :require_user_same, only: [:edit, :update]
  def index
    @All_users = User.paginate(page: params[:page], per_page: 5)
  end
  def new
    @new_user = User.new
  end

  def edit
    @edit = @user
  end

  def update
    @update = @user
    if @update.update(user_params)
      flash[:success] = "your account has been update successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
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

  def show
    @show = @user
    @show_articles = @show.articles.paginate(:page => params[:page],per_page: 5)
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password_digest)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_user_same
      if logged_in? || current_user != @user
        flash[:danger] = "User has to be logged in dude"
        redirect_to root_path
      end
    end

end