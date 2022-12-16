class SignupsController < ApplicationController
#GET /signups
    def index
        signups = Signup.all
        render json: signups
    end

 #   POST /signups
    def create
    signup = Signup.create!(signup_params)
    render json: signup, status: :created
   rescue ActiveRecord::RecordInvalid => e
       render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
   end 

     private
    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
