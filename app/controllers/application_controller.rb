class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    Client.find(session[:user_id]) if session[:user_id]
  end

  def require_login
  	redirect_to root_path if session[:user_id] == nil
  end

  def require_correct_user
  	client = Client.find(params[:id]).client
  	redirect_to '/clients' if current_user != client
  end

  def number_to_currency(number, options = {})
    delegate_number_helper_method(:number_to_currency, number, options)
  end
end
