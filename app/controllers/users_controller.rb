class UsersController < ApplicationController
  def show
    if good_profile?
      @user = current_user
    else
      redirect_to user_path(current_user.id)
    end

  end

  private 
  def good_profile?
    current_user.id.to_s == params["id"]
  end
end