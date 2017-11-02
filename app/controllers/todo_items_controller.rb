class TodoItemsController < ApplicationController
  before_action :set_list
    
  def create
    @todo_item = @list.todo_items.create(todo_item_params)
    redirect_to @list
  end

  def destroy
    @todo_item = @list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @list
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end 



end
