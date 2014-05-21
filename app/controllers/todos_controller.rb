class TodosController < ApplicationController

  def main
  end

  def index
    @todos = Todo.all
    respond_to do |f|
    f.json { render :json => @todos, :only => [:id, :text, :completed]}
    end
  end

  def create 
    todo = Todo.create todo_params
  end

private
  def todo_params
    params.require(:todo).permit(:text, :completed)
  end

end
