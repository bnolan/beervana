class SessionsController < ApplicationController
  
  def create
    user = User.new(user_params)
    
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :text => "Error - user name " + user.errors[:name].to_sentence
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end
  
  def user_params
    params.require(:user).permit(:name)
  end
  
end
