class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    if params[:query].nil? || (params[:query] == "")
      @boats = Boat.all
    else
      params[:query]
       @boats = @boats.where('category ILIKE ?', params[:query])
    end
    if params[:location].nil? || (params[:location] == "")
      @boats = Boat.all
    else
      params[:location]
      @boats = @boats.near(params[:location], 20)
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
    if current_user.boats.update(boat_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  # def update
  #   @boat.update(boat_params)
  #   redirect_to boat_path(@boat)
  # end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to dashboard_path
  end

  private

  def boat_params
    params.require(:boat).permit(:brand, :price, :location, :name, :category, :number_passenger, :description, :photo)
  end
end
