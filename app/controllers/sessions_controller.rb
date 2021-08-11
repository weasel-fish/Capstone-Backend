class SessionsController < ApplicationController
    def index
        render json: session
    end

    def me
        if session[:user_id]
            user = User.find_by(id: session[:user_id])
            render json: user, status: :ok
        else
            head :no_content
        end
    end
    
    def create
        user = User.find_by(username: params[:username])

        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, except: :password_digest, status: :created
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
end
