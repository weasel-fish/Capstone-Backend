class SightingsController < ApplicationController
    def index
        sightings = Sighting.all
        render json: sightings
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting, status: :ok
        else
            render json: {error: "Sighting not found."}, status: :not_found
        end
    end

    def create
        sighting = Sighting.create(sighting_params)
        if sighting.valid?
            render json: sighting, status: :created
        else
            render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        
    end

    def destroy
        sighting = Sighting.find_by(id: params[:id])
        sighting.destroy
        head :no_content
    end

    private

    def sighting_params
        params.permit(:animal_id, :trip_id, :environment, :weather_conditions, :notes)
    end
end
