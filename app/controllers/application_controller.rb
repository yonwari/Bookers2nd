class ApplicationController < ActionController::Base

# deviseコントローラー編集用
  before_action :configure_permitted_parameters, if: :devise_controller?

# deviseコントローラー編集用
  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :image) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :password, :password_confirmation, :image) }
  end


#ログイン後のリダイレクト変更
  private
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

end
