class ItemsController < ApplicationController

  def create
    @item = current_user.items.new(items_params)
    @item.save
  end

  def complete
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])
    if @item.completed_at
      @item.update(completed_at: nil)
    else
      @item.touch(:completed_at)
    end
  end

  def destroy
    @items = current_user.items.where.not(completed_at: nil)
  end

  private

  def items_params
    params.require(:item).permit(:name, :time)
  end
end
