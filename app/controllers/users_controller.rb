class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user, serializer: UserInfoSerializer, status: :ok
        else
            render json: {error: "User not found."}, status: :not_found
        end
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        
    end

    def destroy
        user = User.find_by(id: session[:user_id])
        session.delete :user_id
        user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:username, :address, :avatar, :password)
    end
end
