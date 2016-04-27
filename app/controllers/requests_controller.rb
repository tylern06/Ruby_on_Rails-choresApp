class RequestsController < ApplicationController
	def index
		# @request = Request.create(contractor: Client.find(session[:user_id]), client: Client.find(Chore.client), chore: Chore.find(params[:id]))
	end

	def show
	end

	def new
	end

	def create
		session[:user_id] = 3
		params[:id] = 2
		if session[:user_id] != nil

			client = Chore.find(params[:id]).client
			@request = Request.new(contractor: Client.find(session[:user_id]), client: client, chore: Chore.find(params[:id]))
			puts '***********************'
			puts @request.inspect
			puts '***********************'
			@request.valid?
			@request.save

		else
			puts '-----------------------'
			puts session[:user_id]
			puts '-----------------------'
		end

	end

	def update
	end

	def edit
	end

	def destroy
	end
end
