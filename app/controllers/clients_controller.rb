class ClientsController < ApplicationController
  def index
    @client_chores = Client.find(session[:user_id]).chores
  end

  def show
     @client_chore = Chore.find(params[:id])
  end

  def new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to sessions_path
    else
      flash[:regerrors] = @client.errors.full_messages
      redirect_to :back
    end
  end

  def update
  Chore.find(params[:id]).update(chore_params)
  
  redirect_to clients_path


  end

  def edit
    @client_chore = Chore.find(params[:id])
  end

  def destroy
  end

  private
    def client_params
      params.require(:client).permit(:name, :email, :password, :password_confirmation, :address, :city, :state, :rating, :contractor_id)
    end
    def chore_params
      params.require(:chore).permit(:title, :description, :rate, :start, :end)
    end 
end
