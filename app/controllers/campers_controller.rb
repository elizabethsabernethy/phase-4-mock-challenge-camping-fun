class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_error
    rescue_from ActiveRecord::RecordInvalid, with: :render_cannot_process
  
    def index
        campers = Camper.all 
        render json: campers
    end

    def show
        if params[:id]
            camper = Camper.find(params[:id])
        else
            render_error
        end
        render json: camper, include: :activities
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_error
        render json: {error: 'Camper not found'}, status: :not_found
    end 

    def render_cannot_process(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
