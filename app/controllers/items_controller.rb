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

  private

  def items_params
    params.require(:item).permit(:name)
  end
end
