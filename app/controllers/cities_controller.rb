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
	  @cities = City.friendly.find(params[:id])
	  @articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
	  # @author = User.find(@cities.user_id).first_name
	  render :show
	end

end
