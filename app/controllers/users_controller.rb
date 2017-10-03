class UsersController < ApplicationController
  def show
    @items = current_user.items
    @item = Item.new
  end
end
