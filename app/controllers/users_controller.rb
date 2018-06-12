class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(create show new)
  before_action :load_user, except: %i(index new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index
    @users = User.activated.paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def show
    @microposts = @user.microposts.paginate page: params[:page]
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "user_mailer.check_alert"
      redirect_to root_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:sucess] = t "users.edit.updated"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:sucess] = t "users.index.destroy"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    redirect_to root_url if @user.nil?
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
