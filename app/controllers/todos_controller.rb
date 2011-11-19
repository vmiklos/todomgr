class TodosController < ApplicationController
  def new
    @todo=Todo.new
    @todo.deadline = Time.now
  end

  def edit
  end

  def show
    history = "1".eql?(params[:history])
    if session[:user]
      u = User.find_by_id session[:user]
      @todos = u.get_todo_page params[:page], history
    else
      @todos = Todo.get_page params[:page], history
    end
  end

  def delete
    todo = Todo.find params[:id]
    if todo.delete
      flash[:notice] = 'Delete was susccessfull'
    else
      flash[:notice] = 'Could not delete todo'
    end
    redirect_to :controller => "todos", :action => "show"
  end
end
