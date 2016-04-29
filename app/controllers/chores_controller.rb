class ChoresController < ApplicationController
  before_action :require_login, except: [:index, :new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @chores = Chore.all
    respond_to do |format|
      format.html {render :index}
      format.json {render :json => @chores}

    end
  end

  def show
    @chore = Chore.find(params[:id])
    @already_pending = Request.where(chore: params[:id]).where(contractor: session[:user_id])
    @already_accepted = Network.where(chore: params[:id]).where(contractor: session[:user_id])
  end

  def show_client
    @client_chore = Chore.find(params[:id])
  end

  def new
  end

  def create
    chore = Chore.new(chore_params)
    if chore.save
      chore.update(status: "Open")
      chore.update(client: Client.find(session[:user_id]))
      redirect_to clients_path
    else
      flash[:errors] = chore.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @client_chore = Chore.find(params[:id])
  end

  def update
    Chore.find(params[:id]).update(status:"Completed")
    redirect_to '/contractors'
  end
  
  def update_client
    chore = Chore.update(Chore.find(params[:id]), chore_params)
    if chore.valid?
      redirect_to clients_path
    else
      flash[:errors] = chore.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Chore.delete(params[:id])
    redirect_to clients_path
  end
  

  private
    def chore_params
      params.require(:chore).permit(:title, :description, :rate, :start, :end, :address, :city, :state)
    end 
end
