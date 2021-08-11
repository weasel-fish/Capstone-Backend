class AlertsController < ApplicationController
    def index
        alerts = Alert.all
        render json: alerts
    end

    def show
        alert = Alert.find_by(id: params[:id])
        if alert
            render json: alert, status: :ok
        else
            render json: {error: "Alert not found."}, status: :not_found
        end
    end

    def create
        alert = Alert.create(alert_params)

        if alert.valid?
            render json: alert, status: :created
        else
            render json: {errors: alert.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def destroy
        alert = Alert.find_by(id: params[:id])
        alert.destroy
        head :no_content
    end

    private

    def alert_params
        params.permit(:user_id, :sighting_id)
    end
end
