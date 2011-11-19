class TodosController < ApplicationController
  before_filter :find_todo, :except => [:new, :create, :show]

  def new
    @todo=Todo.new
    @todo.deadline = Time.now
    @todo.public = true
  end

  def edit
  end

  def create
    @todo = Todo.new(params[:todo])
    @todo.user = User.find_by_id session[:user]
    @todo.done = false
    if @todo.save
      flash[:notice] = 'Todo item successfully added'
      redirect_to :controller => "todos", :action => "show"
    else
      flash[:notice] = 'Could not add todo item'
      render :action => 'new'
    end
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
    if @todo.delete
      flash[:notice] = 'Delete was susccessfull'
    else
      flash[:notice] = 'Could not delete todo'
    end
    redirect_to :controller => "todos", :action => "show"
  end

  def update
    if @todo.update_attributes(params[:todo])
      flash[:notice] = 'Update was susccessfull'
      redirect_to :controller => "todos", :action => "show"
    else
      flash[:notice] = 'Could not update todo item'
      render :action => 'edit'
    end
  end

  private
  def find_todo
    @todo = Todo.find(params[:id])
  end

end
