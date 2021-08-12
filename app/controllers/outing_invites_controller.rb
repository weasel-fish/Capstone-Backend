class OutingInvitesController < ApplicationController

    def create
        invite = OutingInvite.create(outing_invite_params)
        if invite.valid?
            render json: invite, status: :created
        else
            render json: {error: 'You have already invited them!'}, status: :unprocessable_entity
        end
    end

    def destroy
        invite = OutingInvite.find_by(id: params[:id])
        invite.destroy
        head :no_content
    end

    def show
        invites = OutingInvite.where(invitee_id: params[:id])
        if invites
            render json: invites
        else
            head :no_content
        end
    end

    private

    def outing_invite_params
        params.permit(:inviter_id, :invitee_id, :outing_id)
    end
end
