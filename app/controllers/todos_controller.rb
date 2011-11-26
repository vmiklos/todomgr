class TodosController < ApplicationController
  before_filter :find_todo, :except => [:new, :create, :show]

  def new
    if session[:user]
      @todo=Todo.new
      @todo.deadline = Time.now
      @todo.public = true
    else
      redirect_to :controller => "todos", :action => "show"
    end
  end

  def edit
    if !session[:user]
      redirect_to :controller => "todos", :action => "show"
    end
  end

  def create
    if session[:user]
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
    else
      flash[:notice] = 'Create without login is not allowed'
      redirect_to :controller => "todos", :action => "show"
    end
  end

  def show
    history = "1".eql?(params[:history])
    search = params[:search]
    if session[:user]
      u = User.find_by_id session[:user]
      @todos = u.get_todo_page params[:page], history, search
    else
      @todos = Todo.get_page params[:page], history, search
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
    if session[:user]
      if @todo.update_attributes(params[:todo])
        flash[:notice] = 'Update was susccessfull'
        redirect_to :controller => "todos", :action => "show"
      else
        flash[:notice] = 'Could not update todo item'
        render :action => 'edit'
      end
    else
      flash[:notice] = 'Update without login is not allowed'
      redirect_to :controller => "todos", :action => "show"
    end
  end

  private
  def find_todo
    @todo = Todo.find(params[:id])
  end

end
