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
            if params[:no_avatar]   #Default avatar
                user.avatar.attach(
                    io: File.open('./public/avatars/profile.png'),
                    filename: 'profile.png',
                    content_type: 'application/png'
                )
                session[:user_id] = user.id
                render json: user, serializer: CurrentUserSerializer, status: :created
            else                #Custom Avatar
                session[:user_id] = user.id
                render json: user, status: :created
                # render json: user, serializer: UserSignupSerializer, status: :created
            end
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        user = User.find_by(id: params[:id])
        user.update(avatar: params[:avatar])
        render json: user, serializer: CurrentUserSerializer, status: :created
    end

    def update_email
        user = User.find_by(id: params[:id])
        user.update(address: params[:address])
        render json: user, serializer: CurrentUserSerializer, status: :created
    end

    def destroy
        user = User.find_by(id: params[:id])
        session.delete :user_id
        user.destroy
        head :no_content
    end

    private

    def user_params
        params.permit(:username, :address, :password)
    end
end
