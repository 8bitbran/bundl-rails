class EventsController < ApplicationController
    def index 
        @events = Event.all
    end
    
    def show
        find_event
    end 

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to @event
        else 
            render :new
        end
    end

    private 

    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :location, :group_id)
    end
end
