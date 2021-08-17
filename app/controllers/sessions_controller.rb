class SessionsController < ApplicationController
    def index
        render json: session
    end

    def me
        if session[:user_id]
            user = User.find_by(id: session[:user_id])
            render json: user, serializer: CurrentUserSerializer, status: :ok
        else
            head :no_content
        end
    end
    
    def create
        user = User.find_by(username: params[:username])
        # avatar = rails_blob_path(user.avatar)
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            # render json: {
            #     user: ActiveModelSerializers::SerializableResource.new(user, serializer: CurrentUserSerializer),
            #     avatar: avatar
            # }, status: :created
            render json: user, serializer: CurrentUserSerializer, status: :created
        else
            render json: {error: "Incorrect username and/or password"}, status: :unauthorized
        end
    end

    def destroy
        if session[:user_id]
            session.delete :user_id
            head :no_content
        else
            render json: {error: "Uh-oh, something went wrong!"}, status: :unauthorized
        end
    end

    def front_load
        animals = Animal.all
        users = User.all
        # render json: {users: users, animals: animals}, status: :ok
        render json: {
            users: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UserSerializer),
            animals: ActiveModelSerializers::SerializableResource.new(animals, each_serializer: AnimalSerializer)
        }
    end

end
