class ApplicationController < ActionController::Base
  include RelationshipsHelper
  include GroupsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :profile, :body_weight, :target_weight])
  end
  def check_user
    if @user.id != current_user.id
      redirect_to user_path
    end
  end
  def set_user
    @user = User.find(params[:id])
  end
end
