class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    @password_reset = PasswordReset.new(user_id: user.id)

    if @password_reset.save
      binding.pry
      # kick off email job
      redirect_to new_password_reset_path, notice: "Check your email for your password reset link."
    end
  end

  def edit
    @password_reset = PasswordReset.find_by(token: params[:token])
    @user = @password_reset.user
  end

  def update

  end
end
