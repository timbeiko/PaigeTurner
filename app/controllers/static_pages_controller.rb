class StaticPagesController < ApplicationController
  def index
    if logged_in?
      link = '/users/' + current_user.id.to_s
      redirect_to  link
    end
  end
end