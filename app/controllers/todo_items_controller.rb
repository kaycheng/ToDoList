class TodoItemsController < ApplicationController
  before_action :set_list
  before_action :set_todo_item, except: [:create]
    
  def create
    @todo_item = @list.todo_items.create(todo_item_params)
    redirect_to @list
  end

  def destroy
    if @todo_item.destroy
      flash[:success] = "Todo List item was deleted."
    else
      flash[:error] = "Todo List item could not be deleted."
    end
    redirect_to @list
  end

  def complete
    @todo_item.update_attribute(:completed_at, Time.now)
    redirect_to @list, notice: "Todo item completed"
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end 

  def set_todo_item
    @todo_item = @list.todo_items.find(params[:id])
  end

end
