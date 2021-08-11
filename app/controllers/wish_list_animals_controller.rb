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

    def destroy
        wish = WishListAnimal.find_by(id: params[:id])
        wish.destroy
        head :no_content
    end

    private

    def wish_params
        params.permit(:animal_id, :user_id)
    end
end
