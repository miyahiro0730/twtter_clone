class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to tweets_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])

    # お気に入り情報を取得
    @favorites = current_user.favorites.where(user_id: @user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

end
