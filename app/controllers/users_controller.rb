class UsersController < ApplicationController

  before_filter :find_user, :except => [:new, :create]

  def new
  end

  def create
    if session[:user]
      flash[:notice] = 'Already registered'
      redirect_to :controller => "todos", :action => "show"
    else
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
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Update was susccessfull'
      redirect_to :controller => "todos", :action => "show"
    else
      flash[:notice] = 'Could not update personal data'
      render :action => 'edit'
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def forgotten
  end

end
