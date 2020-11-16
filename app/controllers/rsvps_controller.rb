class RsvpsController < ApplicationController
    before_action :require_login

    def create
        @rsvp = current_user.rsvps.build(rsvp_params)
        if @rsvp.save
            flash[:success] = "You RSVP'd"
            redirect_to root_path
        else 
            flash[:danger] = "Failed to submit RSVP"
            redirect_to root_path
        end
    end
    
    def destroy
        @rsvp = Rsvp.find(params[:id])
        @rsvp.destroy if @rsvp.user == current_user
        redirect_to root_path
    end

    private

    def rsvp_params
        params.require(:rsvp).permit(:event_id)
    end
end 