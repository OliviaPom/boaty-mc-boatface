class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
      # render 'boats/show'
    end
  end

  def accept_booking
    booking = Booking.find(params[:booking])
    booking.accepted = true
    if booking.save
      redirect_to dashboard_path
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    if @booking.update(booking_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :accepted)
  end
end
