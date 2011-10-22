class TodosController < ApplicationController
  def new
    @todo=Todo.new
    @todo.deadline = Time.now
  end

  def edit
  end

  def show
  end

end
