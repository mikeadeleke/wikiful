class SessionsController < ApplicationController
  def new
    puts "a"
  end
  
  def create
    user = User.find_by_email(params[:email])
    puts "a"
    if user && user.authenticate(params[:password]) # get this for free from has_secure_password
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in"
      puts "b"
    else
      flash.now.alert = "Email or password is invalid"
      puts "c"
      render "new"
    end
    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
