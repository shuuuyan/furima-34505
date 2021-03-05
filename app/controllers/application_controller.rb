class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # deviseのUserモデルにパラメーターを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthdate])
  end
end
