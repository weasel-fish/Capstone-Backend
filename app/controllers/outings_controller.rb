class OutingsController < ApplicationController
    def index
        outings = Outing.all
        render json: outings
    end

    def show
        outing = Outing.find_by(id: params[:id])
        if outing
            render json: outing, status: :ok
        else
            render json: {error: "Outing not found."}, status: :not_found
        end
    end

    def create
        outing = Outing.create(outing_params)
        if outing.valid?
            render json: outing, status: :created
        else
            render json: {errors: outing.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        
    end

    def destroy
        outing = Outing.find_by(id: params[:id])
        outing.destroy
        head :no_content
    end

    private

    def outing_params
        params.permit(:name, :location, :date, :description, :image, :notes)
    end
end
