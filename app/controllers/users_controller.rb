class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if current_user.update(user_params)
      flash[:success] = 'プロフィールが変更されました'
      redirect_to current_user
    else
      flash.now[:danger] = 'プロフィールは変更されませんでした'
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :goal)
  end
end
