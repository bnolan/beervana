class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:callback]

  def create
    name = params[:name]
    password = User.hash_password(params[:password])
    
    user = User.find_by_name(params[:name])
    
    if user and user.password == password
      session[:user_id] = user.id
      redirect_to root_path
    elsif user
      render :text => "Username in use, or password was incorrect. Go back and try again."
    elsif name.present? and params[:password].present?
      user = User.create! :name => name, :password => password
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :text => "Invalid username or password. Go back and try again."
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

  # def callback
  #   omniauth = request.env['omniauth.auth']
  #   authhash = {
  #     :uid => omniauth['uid'],
  #     :nickname => omniauth['info']['nickname'],
  #     :name => omniauth['info']['name'],
  #   }
  #   user = User.find_or_initialize_by(:uid => authhash['uid'])
  #   user.attributes = authhash
  #   user.save!
  #   session[:user_id] = user.id
  #   redirect_to root_path
  # end
  # 
  # def failure
  #   redirect_to root_path
  # end
  
end
