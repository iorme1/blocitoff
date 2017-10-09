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
    @items.destroy_all
    if current_user.items.count < 1
      flash[:notice] = "You have completed all of your To-do items. Congratulations!"
      redirect_to user_path
    elsif current_user.items.count >= 1
      flash[:notice] = "Nice work, #{current_user.items.count} more to go!"
      redirect_to user_path
    else
      flash[:alert] = "To-do item was not deleted. Please try again."
      redirect_to user_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :time)
  end
end
