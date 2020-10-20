class RsvpsController < ApplicationController

    def create
        @rsvp = current_user.rsvps.build(rsvp_params)
        if @rsvp.save
            flash[:success] = "You RSVP'd"
            redirect_to root
        else 
            flash[:danger] = "Failed to submit RSVP"
            redirect_to root
    end
    
    def destroy
        @rsvp = Rsvp.find(params[:id])
        @rsvp.destroy
        redirect_to root
    end

    private

    def rsvp_params
        params.require(:rsvp).permit(:event_id)
    end
end 