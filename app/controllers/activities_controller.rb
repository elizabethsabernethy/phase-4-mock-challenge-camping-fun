class ActivitiesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_error

    def index
        activities = Activity.all 
        render json: activities
    end

    def destroy
        if params[:id]
            activity = Activity.find(params[:id])
            activity.destroy
        else
            render_error
        end
        render json: activity, include: :signups
    end

    private

    def activities_params
        params.permit(:name, :difficulty)
    end

    def render_error
        render json: {error: "Activity not found"}, status: :not_found
    end
end
