class FriendsController < ApplicationController
  def show
    @user = current_user
    @friends = @user.friends
  end
end
