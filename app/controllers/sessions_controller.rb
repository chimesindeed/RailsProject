#
class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #redirect_to 'new', notice: 'Logged in!'
    else
     puts "hello" #render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to 'new', notice: 'Logged out!'
  end
end
