# app/controllers/friendships_controller.rb
class FriendshipsController < ApplicationController

  def show
    @users = User.all
    @current_user = current_user
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    if @friendship.save
      flash[:notice] = 'Запрос дружбы отправлен.'
      redirect_to users_path
    else
      flash[:alert] = 'Ошибка отправки запроса дружбы.'
      redirect_to users_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(confirmed: true)
    flash[:notice] = 'Дружба подтверждена.'
    redirect_to current_user
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Запрос дружбы отклонен.'
    redirect_to current_user
  end
end
