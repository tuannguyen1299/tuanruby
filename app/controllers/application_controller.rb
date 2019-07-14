class ApplicationController < ActionController::Base
#update thêm name và age vào bảng user cần thêm những dòng này vào applicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,:age ])
  end
end
