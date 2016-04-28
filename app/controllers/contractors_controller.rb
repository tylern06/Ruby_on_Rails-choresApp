class ContractorsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    # session[:user_id] = 3
    @contractor = Client.find(session[:user_id])
    @pendingrequests = Request.where(contractor: session[:user_id])
    @acceptedrequests = Network.where(contractor: session[:user_id])
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
