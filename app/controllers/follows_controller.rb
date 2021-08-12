class FollowsController < ApplicationController
    
    def create
        follow = Follow.create(follow_params)

        if follow.valid?
            render json: follow, status: :created
        else
            render json: {errors: follow.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        follow = Follow.find_by(follow_params)
        follow.destroy
        head :no_content
    end

    private

    def follow_params
        params.permit(:follower_id, :followee_id)
    end
end
