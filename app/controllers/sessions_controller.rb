class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
   user = User.find_by(email: params[:email])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to root_path, success: 'Logged in'
   else
     redirect_back(fallback_location: root_path, danger: 'Invalid email or password!')
   end
 end

 def destroy
   session[:user_id] = nil
   redirect_to log_in_path
 end
end
