class PlantsController < ApplicationController

    def index
        plants = Plant.only(:name, :image, :price)
        render json: plants
    end

    def show
        plants = Plant.find_by(id: params[:id])
        if plants
        render json: plants 
        else 
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plants_params)
        render json: plant 
    end

    private

    def plants_params
        params.permit(:name, :image, :price)
    end
end
