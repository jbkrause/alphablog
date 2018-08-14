class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "welcome to the appha blog #{@user.username}"
      redirect_to articles_path
    else # if incorect user, we displa new usertemplate, but with errors displaye by partial
      render 'new'
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
    
end
