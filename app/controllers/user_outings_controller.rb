class UserOutingsController < ApplicationController

    def create
        user_outing = UserOuting.create(user_outing_params)

        if user_outing.valid?
            render json: user_outing, status: :created
        else
            render json: {errors: user_outing.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def accept
        attendance = UserOuting.create(user_id: user_outing_params[:user_id], outing_id: user_outing_params[:outing_id])
        if attendance.valid?
            invite = OutingInvite.find_by(id: accept_params[:outing_invite_id])
            invite.destroy
            render json: attendance, status: :created
        else
            render json: {errors: attendance.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        user_outing = UserOuting.find_by(user_outing_params)
        user_outing.destroy
        head :no_content
    end

    private

    def user_outing_params
        params.permit(:user_id, :outing_id)
    end

    def accept_params
        params.permit(:user_id, :outing_id, :outing_invite_id)
    end

end
