class ChoresController < ApplicationController
  def index
  end

  def show
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

  def update
  end

  def edit
  end

  def destroy
  end

  private
    def chore_params
      params.require(:chore).permit(:title, :description, :rate, :start, :end)
    end 
end
