class OutingInvitesController < ApplicationController

    def create
        invite = OutingInvite.create(outing_invite_params)
        if invite.valid?
            render json: invite, status: :created
        else
            render json: {errors: invite.errrors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def outing_invite_params
        params.permit(:inviter_id, :invitee_id, :outing_id)
    end
end
