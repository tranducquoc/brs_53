class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include ActivitiesHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "app.controller.please_login"
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find_by id: params[:id]
    unless @user
      flash[:warning] = t "app.controllers.not_found_user"
      redirect_to root_url
    end
    redirect_to root_url unless current_user? @user
  end

  def verify_admin?
    if current_user.present?
      rederect_to root_url  unless current_user.is_admin?
    else
      redirect_to root_path
    end
  end
end
wsddnv


