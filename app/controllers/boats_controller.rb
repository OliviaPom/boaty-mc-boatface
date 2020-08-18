class BoatsController < ApplicationController
  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat.update(boat_params)

    redirect_to boat_path(@boat)
  end

  private

  def boat_params
    params.require(:boat).permit(:name)
    params.require(:boat).permit(:brand, :price, :location, :name, :category)
  end
end
