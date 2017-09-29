class ItemsController < ApplicationController


  def create
    @item = current_user.items.new(items_params)

    if @item.save
      redirect_to root_path
      flash[:notice] = "To-do item successfully saved!"
    else
      flash[:alert] = "To-do item was not saved. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    if current_user.items.count < 1
      flash[:notice] = "You have completed all of your To-do items. Congratulations!"
      redirect_to root_path
    elsif current_user.items.count >= 1
      flash[:notice] = "Nice work, #{current_user.items.count} more to go!"
      redirect_to root_path
    else
      flash[:alert] = "To-do item was not deleted. Please try again."
      redirect_to root_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:name)
  end
end
