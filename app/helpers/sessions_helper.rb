# app/helpers/sessions_helper.rb
module SessionsHelper
  # ユーザーをログイン状態にする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す(いなければnil)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ログイン中であればtrueを返す
  def logged_in?
    !!current_user
  end

  # ログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end