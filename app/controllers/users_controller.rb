class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @q = @users.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def create
    @user.save
    respond_with @user
  end

  def update
    @user.update(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end
  
  private

  def user_params
    permitted_keys = [:username,
                      :email,
                      :password,
                      :password_confimation,
                      :role]

    #permitted_keys << :role if can?(:edit_role, @user)

    #params.require(:user).permit(permitted_keys)
  end
  
end
