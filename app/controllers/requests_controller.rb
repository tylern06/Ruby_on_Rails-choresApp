class RequestsController < ApplicationController
	def index
		# @request = Request.create(contractor: Client.find(session[:user_id]), client: Client.find(Chore.client), chore: Chore.find(params[:id]))
	end

	def show

	end

	def new
	end

	def create
		client = Chore.find(params[:id]).client
		@request = Request.new(contractor: Client.find(session[:user_id]), client: client, chore: Chore.find(params[:id]))
		@request.valid?
		@request.save
		redirect_to '/contractors'
	end

	def update
	end

	def edit
	end

	def destroy
	end
end
