class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      @current_user = @user
      session[:user] = @current_user.id
      flash[:notice] = 'Successfull registration'
      redirect_to :controller => "todos", :action => "show"
    else
      flash[:notice] = 'User name is already in use'
      render :action => 'new'
    end
  end

  def show
  end

  def edit
  end

  def forgotten
  end

end
