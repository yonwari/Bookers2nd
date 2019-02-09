class ApplicationController < ActionController::Base

# deviseコントローラー編集用
  before_action :configure_permitted_parameters, if: :devise_controller?

# deviseコントローラー編集用
  protected
  def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password, :password_confirmation) }
  end


#ログイン後のリダイレクト変更
  private
  def after_sign_in_path_for(resource)
    after_login_to_index_path
  end

end
