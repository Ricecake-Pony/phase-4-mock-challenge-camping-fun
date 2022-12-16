class CampersController < ApplicationController
    #GET /camper
    def index
        campers = Camper.all 
        render json: campers
        end
     #SHOW /camper
      def show
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper,
        else
            render json: {error: "Camper not found"}, status: :not_found
        end
      end  
     #POST /camper
    def create
     camper = Camper.create!(camper_params)
     render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end  
    # Study this rescue code block^^

    private
    def camper_params
    params.permit(:name, :age)
    end
end
