class ClientsController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @client_chores = Client.find(session[:user_id]).chores
    @client = Client.find(session[:user_id])
  end

  def show
     
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
    chore = Chore.update(Chore.find(params[:id]), chore_params)
    if chore.valid?
      redirect_to clients_path
    else
      flash[:errors] = chore.errors.full_messages
      redirect_to :back
    end
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
      params.require(:chore).permit(:title, :description, :rate, :start, :end, :address, :city, :state)
    end 
end
