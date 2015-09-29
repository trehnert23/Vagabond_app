class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def new
	  @cities = City.new
	  render :new
	end

	def show
	  @cities = City.find_by({id: params[:id]})
	  # @author = User.find(@cities.user_id).first_name
	  render :show
	end

end
