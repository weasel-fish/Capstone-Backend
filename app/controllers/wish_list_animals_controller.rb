class WishListAnimalsController < ApplicationController
    def index
        wishes = WishListAnimal.all
        render json: wishes
    end

    def show
        wish = WishListAnimal.find_by(id: params[:id])
        if wish
            render json: wish, status: :ok
        else
            render json: {error: "WishListAnimal not found."}, status: :not_found
        end
    end

    def create
        wish = WishListAnimal.create(wish_params)

        if wish.valid?
            render json: wish, status: :created
        else
            render json: {errors: wish.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def create_with_new_animal
        animal = Animal.create(common_name: wish_with_new_params[:common_name], scientific_name: wish_with_new_params[:scientific_name], description: wish_with_new_params[:description])
        if animal.valid?
            wish = WishListAnimal.create(animal_id: animal.id, user_id: wish_with_new_params[:user_id])
            if wish.valid?
                render json: {
                    wish: ActiveModelSerializers::SerializableResource.new(wish, serializer: WishListAnimalSerializer),
                    animal: ActiveModelSerializers::SerializableResource.new(animal, serializer: AnimalSerializer)
                }
                # render json: wish, status: :created
            else
                render json: {errors: wish.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {errors: animal.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        wish = WishListAnimal.find_by(id: params[:id])
        wish.destroy
        head :no_content
    end

    private

    def wish_params
        params.permit(:animal_id, :user_id)
    end

    def wish_with_new_params
        params.permit(:user_id, :common_name, :scientific_name, :description)
    end
end
