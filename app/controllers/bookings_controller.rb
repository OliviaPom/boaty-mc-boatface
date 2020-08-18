class BookingsController < ApplicationController
  def new
    @booking = Booking.new(booking_params)
  end

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.save
    redirect_to boat_path(@boat)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking.update(booking_params)
    redirect_to dashboard_path
  end

    private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
