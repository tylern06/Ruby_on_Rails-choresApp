class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    client = Client.find_by_email(client_params[:email])

      if client && client.authenticate(client_params[:password])
        session[:user_id] = client.id 
        if params[:optionsRadios] == "option1"
          redirect_to clients_path
        else
          redirect_to contractors_path
        end
      else 
        flash[:logerrors] = ["Invalid combination"]
        redirect_to :back
      end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def client_params
      params.require(:client).permit(:email, :password)
    end 
end
