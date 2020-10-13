class ApplicationController < ActionController::Base
  include RelationshipsHelper
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    users_path(resource.id)
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :body_weight, :target_weight])
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
