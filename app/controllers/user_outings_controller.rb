class UserOutingsController < ApplicationController

    def create
        user_outing = UserOuting.create(user_outing_params)

        if user_outing.valid?
            render json: user_outing, status: :created
        else
            render json: {errors: user_outing.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        user_outing = UserOuting.find_by(id: params[:id])
        user_outing.destroy
        head :no_content
    end

    private

    def user_outing_params
        params.permit(:user_id, :outing_id)
    end

end
