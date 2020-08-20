class BoatsController < ApplicationController
  def index
    categories = []
    boats = Boat.all
    boats.each do |boat|
      categories << boat.category.downcase
    end

    if params[:query].nil? || (params[:query] == "")
      @boats = Boat.all
    elsif categories.include?(params[:query].downcase)
      @boats = []
      boats.each do |boat|
        @boats << boat if boat.category.downcase == params[:query].downcase
      end
      return @boats
    else
      @boats = Boat.near(params[:query], 20)
    end
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @boat = Boat.find(params[:id])
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:brand, :price, :location, :name, :category)
  end
end
