class EventsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    
    def index 
        @events = Event.all
        @group = Group.find(params[:group_id]) if params[:group_id]
    end
    
    def show
        find_event
    end 

    def new
        @group = Group.find(params[:group_id])
        if @group.user == current_user
            @event = Event.new
        else
            flash[:danger] = "You must be the group owner to create events."
            redirect_to @group
        end
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to group_path(@event.group)
        else 
            render :new
        end
    end

    private 

    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :location, :group_id, :starttime, :endtime)
    end
end
