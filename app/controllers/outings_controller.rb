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
        attendance = UserOuting.create(user_id: session[:user_id], outing_id: outing.id)
        if outing.valid? && attendance.valid?

            if params[:no_image]   #Default avatar
                outing.image.attach(
                    io: File.open('./public/outing_images/mountain.jpg'),
                    filename: 'mountain.jpg',
                    content_type: 'application/jpg'
                )
                render json: outing, status: :created
            else                #Custom Avatar
                render json: {id: outing.id}, status: :created
                # render json: user, serializer: UserSignupSerializer, status: :created
            end

        else
            render json: {errors: [*attendance.errors.full_messages, *outing.errors.full_messages]}, status: :unprocessable_entity
        end
    end

    def update
        outing = Outing.find_by(id: params[:id])
        outing.update(outing_params)
        if outing.valid?
            render json: outing, status: :created
        else
            render json: {errors: outing.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def add_image
        outing = Outing.find_by(id: params[:id])
        outing.update(image: params[:image])
        render json: outing, status: :created
    end

    def destroy
        outing = Outing.find_by(id: params[:id])
        outing.destroy
        head :no_content
    end

    private

    def outing_params
        params.permit(:name, :location, :date, :description, :notes)
    end
end
