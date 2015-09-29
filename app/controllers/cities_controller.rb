class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def new
	  @cities = City.new
	  render :new
	end
	def create
    city_params = params.require(:city).permit(:name, :street, :country)
    @city = City.create(city_params)
  	end

	def show
	  @cities = City.find_by({id: params[:id]})
	  # @author = User.find(@cities.user_id).first_name
	  render :show
	end

end
