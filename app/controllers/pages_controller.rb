class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @myboats = current.user
    @mybookings = current.user
  end
end
