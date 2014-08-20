class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_filter :unmangle_params

  def requires_current_user
    if current_user.present?
      # ok
    else
      redirect_to new_session_path
    end
  end
  
  def current_user
    @current_user ||= if session[:user_id]
      User.find session[:user_id]
    elsif params[:username] and params[:password] # fixme - and request.ssl?
      if user = User.find_by_name(params[:username]) and user.password_is?(params[:password]) 
        user
      else
        nil
      end
    else
      nil
    end
  end

  # Proguard over-optimized the app and mangled the parameters posted to drinks#create
  def unmangle_params
    if params[:a] && params[:b] && params[:c] && request.post?
      params[:username] = params[:a]
      params[:password] = params[:b]
      params[:drink] = params[:c]
    end
  end

  helper_method :current_user
  
end
