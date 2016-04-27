class ChoresController < ApplicationController
  def index
    # @chores = Chore.all
    # @hash = Gmaps4rails.build_markers(@chores) do |chore, marker|
    #   marker.lat chore.client.address
    #   marker.lng chore.client.address
    # end
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
  end

  def create
    chore = Chore.new(chore_params)
    if chore.save
      chore.update(client: Client.find(session[:user_id]))
      redirect_to clients_path
    else
      flash[:addchore_errors] = chore.errors.full_messages
      redirect_to :back
    end
  end

  def edit
  end

  def update
    Chore.find(params[:id]).update(status:"Completed")
    redirect_to '/contractors'
  end

  def destroy
  end
  

  private
    def chore_params
      params.require(:chore).permit(:title, :description, :rate, :start, :end)
    end 
end
