class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show]
  before_action :requires_same_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "welcome to the appha blog #{@user.username}"
      redirect_to user_path(@user)
    else # if incorect user, we display new usertemplate, but with errors displaye by partial
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id]) #see before_action
  end

  def update
    #@user = User.find(params[:id]) #see before_action
    if @user.update(user_params)
      flash[:success] = "your acount was updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
    #@user = User.find(params[:id]) #see before_action
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def requires_same_user
      if current_user != @user
        flash[:danger] = "you can only edit our delete your own account"
        redirect_to root_path
      end
    end

    
end
