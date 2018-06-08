class AccountActivationsController < ApplicationController
  before_action :load_user, only: :edit

  def edit
    if @user && !@user.activated? && user.authenticated?(:activation, params[:id])
      active_sucess?
    else
      flash[:danger] = t "user_mailer.invalid"
      redirect_to root_url
    end
  end

  private

  def load_user
    @user = User.find_by email: params[:email]
  end

  def active_sucess?
    if user.update_attributes activated: true, activated_at: Time.zone.now
      log_in user
      flash[:success] = t "user_mailer.activated"
    else
      log_in @user
      flash[:danger] = t "user_mailer.not_active"
    end
    redirect_to user
  end
end
