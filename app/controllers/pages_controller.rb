class PagesController < ApplicationController
  # load_and_authorize_resource
  # skip_authorization_check only: [:index]

  def index
    @users = User.all.order("id ASC")
    authorize! :index, @users
  end

  def role_update
    @user = User.find(params[:id])
    authorize! :index, @user

    if @user.admin?
      @user.visit!
    else
      @user.admin!
    end

      redirect_to dashboard_path, alert: 'User role was successfully updated.'
  end

  def user_delete
    @user = User.find(params[:id])
    authorize! :index, @user
    @user.destroy

    redirect_to dashboard_path, alert: 'User was successfully deleted.'
  end
end
