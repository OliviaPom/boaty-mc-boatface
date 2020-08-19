class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def home
    @boats = Boat.all.sample(3)
  end

  def dashboard
    @my_boats = current_user.boats
    @bookings_ive_made = current_user.bookings
    @bookings_people_have_made_for_my_boats = current_user.boats_bookings
  end
end
