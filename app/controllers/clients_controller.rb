class ClientsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user_profile, only: [:show, :edit, :update, :destroy]

  def index
    @client_chores = Client.find(session[:user_id]).chores
    @client = Client.find(session[:user_id])
  end

  def show
     @client = Client.find(session[:user_id])
  end

  def new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to sessions_path
    else
      flash[:errors] = @client.errors.full_messages
      redirect_to :back
    end
  end

  def update
    client = Client.update(params[:id], client_params)
    if client.valid?
      redirect_to clients_path
    else
      flash[:errors] = client.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def destroy
  end

  private
    def client_params
      params.require(:client).permit(:name, :email, :password, :password_confirmation, :address, :city, :state, :rating, :contractor_id)
    end
    def chore_params
      params.require(:chore).permit(:title, :description, :rate, :start, :end, :address, :city, :state)
    end 
end
