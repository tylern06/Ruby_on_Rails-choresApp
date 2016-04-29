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
		Request.find(params[:id]).chore.update(status: "In Progress")

		request = Request.find(params[:id])

		Network.create(client_id: request.client_id, contractor_id: request.contractor_id, chore_id: request.chore_id)
		redirect_to '/chores_client/' + request.chore_id.to_s
	end

	def edit
	end

	def destroy
	end
end

