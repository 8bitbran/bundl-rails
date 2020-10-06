class EventsController < ApplicationController
    def index 
        @events = Event.all
    end
    
    def show
        find_event
    end 

    private 

    def find_event
        @event = Event.find(params[:id])
    end
end
