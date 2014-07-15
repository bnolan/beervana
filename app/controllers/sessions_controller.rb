class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:callback]

  # This isn't great and should be refactored
  def create
    name = params[:name] || params[:username] # cough, ahem.
    password = params[:password]
    
    user = User.find_by_name(name)
    
    if user and user.password_is? password
      session[:user_id] = user.id

      if params[:email].present?
        user.update_attributes! :email => params[:email]
      end

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => { :success => true, :user => user } }
      end
    elsif user
      message = "Username in use, or password was incorrect. Go back and try again."

      respond_to do |format|
        format.html { render :text => message }
        format.json { render :json => { :success => false, :message => message } }
      end
    elsif name.present? and password.present?
      user = User.create! :name => name, :password => User.hash_password(password), :email => params[:email]
      session[:user_id] = user.id

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => { :success => true, :user => user } }
      end
    else
      message = "Invalid username or password. Go back and try again."

      respond_to do |format|
        format.html { render :text => message }
        format.json { render :json => { :success => false, :message => message } }
      end
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
