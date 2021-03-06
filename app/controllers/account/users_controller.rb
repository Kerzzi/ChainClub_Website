class Account::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index

  end

  def show
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "修改成功"
      redirect_to account_users_path
    else
      render "edit"
    end
  end

  protected

  def find_user
    @user = current_user
    # 跟刚才后台情况一样，如果没有 @user.profile，要先新建一个
    # unless @user.profile 等同于 if !@user.profile 或 if @user.profile.nil?
    @user.create_profile unless @user.profile
  end

  def user_params
    params.require(:user).permit(:time_zone, :summary, :username, :avatar, :remove_avatar, :profile_attributes => [:id, :name, :birthday, :location, :school, :education, :company, :occupation, :position, :address, :qq, :github, :weibo, :wechat, :bio,:postal_code, :specialty, :phone])
  end
end
