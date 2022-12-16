class ActivitiesController < ApplicationController
#GET /activity
    def index
    activities = Activity.all 
    render json: activities
    end

    #DELETE /activity
    def destroy
      activity = Activity.find_by(id: params[:id])
      if activity
        activity.destroy!
        head :no_content  
      else
        render json: {error: "Activity not found"}, status: :not_found
      end
    end

    # The error isn't being returned correctly here for the DELETE^^

    
end
