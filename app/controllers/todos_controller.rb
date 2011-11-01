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
      @todos = u.todos
    else
      @todos = Todo.find :all
    end
  end

end
