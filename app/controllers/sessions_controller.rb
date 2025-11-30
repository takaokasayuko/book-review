class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      reset_session
      log_in(@user)
      redirect_to root_path
    else
      @user ||= User.new(email: params[:session][:email])
      @user.errors.add(:base, "メールアドレスまたはパスワードが正しくありません")
      render :new, status: :unprocessable_entity
    end
  end
end
