# app/controllers/friendships_controller.rb
class FriendshipsController < ApplicationController

  def show
    @users = User.all
  end

  def create
    # Код для создания запроса на дружбу
  end

  def update
    # Код для принятия запроса на дружбу
  end

  def destroy
    # Код для отмены дружбы
  end
end
