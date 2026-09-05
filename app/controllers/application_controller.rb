class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  include SessionsHelper

  allow_browser versions: :modern

  private

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "ログインしてください"
    end
  end
end
