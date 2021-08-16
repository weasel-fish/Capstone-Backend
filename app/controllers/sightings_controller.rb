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

    def create_with_new_animal
        animal = Animal.create(common_name: sighting_with_new_params[:common_name], scientific_name: sighting_with_new_params[:scientific_name], description: sighting_with_new_params[:description])
        
        if animal.valid?
            sighting = Sighting.create(animal_id: animal.id, outing_id: sighting_with_new_params[:outing_id], environment: sighting_with_new_params[:environment], weather_conditions: sighting_with_new_params[:weather_conditions], notes: sighting_with_new_params[:notes])
            if sighting.valid?
                render json: sighting, status: :created
            else
                render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {errors: animal.errors.full_messages}, status: :unprocessable_entity
        end

    end

    def update
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            sighting.update(sighting_params)
            if sighting.valid?
                render json: sighting, status: 200
            else
                render json: {errors: sighting.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: 'Sighting not found.'}, status: :not_found
        end
    end

    def destroy
        sighting = Sighting.find_by(id: params[:id])
        sighting.destroy
        head :no_content
    end

    private

    def sighting_params
        params.permit(:animal_id, :outing_id, :environment, :weather_conditions, :notes)
    end

    def sighting_with_new_params
        params.permit(:animal_id, :outing_id, :environment, :weather_conditions, :notes, :common_name, :scientific_name, :description)
    end
end
