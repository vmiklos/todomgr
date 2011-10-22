class TodosController < ApplicationController
  def new
    @todo=Todo.new
    @todo.deadline = Time.now
  end

  def edit
  end

  def show
    vmiklos = User.find :first
    todo1 = Todo.new
    todo1.deadline = Time.now
    todo1.todo = "Fix bugs"
    todo1.done = false
    todo1.user_id = vmiklos.id
    todo1.public = true

    todo2 = Todo.new
    todo2.deadline = Time.now
    todo2.todo = "Read RSS"
    todo2.done = false
    todo2.user_id = vmiklos.id
    todo2.public = true

    @todos = [todo1, todo2]
  end

end
