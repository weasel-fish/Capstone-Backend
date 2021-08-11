class AnimalsController < ApplicationController
    def index
        animals = Animal.all
        render json: animals
    end

    def show
        animal = Animal.find_by(id: params[:id])
        if animal
            render json: animal, status: :ok
        else
            render json: {error: "Animal not found."}, status: :not_found
        end
    end

    def create
        animal = Animal.create(animal_params)

        if animal.valid?
            render json: animal, status: :created
        else
            render json: {errors: animal.errors.full_messages}, status: :unprocessable_entity
        end
    end
    
    def update

    end

    def destroy
        animal = Animal.find_by(id: params[:id])
        animal.destroy
        head :no_content
    end

    private

    def animal_params
        params.permit(:common_name, :scientific_name, :image, :description)
    end
end
