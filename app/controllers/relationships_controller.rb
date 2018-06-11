class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :load_relationship, only: :destroy

  def create
    @user = User.find_by id: params[:followed_id]
    redirect_to root_path if @user.nil?
    @current_user.follow @user
    redirect_to @user
  end

  def destroy
    @user = @relation.followed
    if @user.nil?
      flash.now[:danger] = t "relationships.notice"
      redirect_to @current_user
    else
      current_user.unfollow @user
      redirect_to @user
    end
  end

  private

  def load_relationship
    @relation = Relationship.find_by id: params[:id]
    redirect_to @current_user if @relation.nil?
  end
end
