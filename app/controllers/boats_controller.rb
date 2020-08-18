class BoatsController < ApplicationController

def show
  @boat = Boat.find(params[:id])
end

def destroy
 @boat = Boat.find(params[:id])
 @boat.destroy
 redirect_to boats_path
end


private

def boat_params
params.require(:boat).permit(:brand, :price, :location, :category, :name)
end

end
