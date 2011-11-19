class TodosController < ApplicationController
  def new
    @todo=Todo.new
    @todo.deadline = Time.now
  end

  def edit
  end

  def show
    if session[:user]
      u = User.find_by_id session[:user]
      @todos = u.get_todo_page params[:page]
    else
      @todos = Todo.get_page params[:page]
    end
  end

end
