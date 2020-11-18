class EventsController < ApplicationController
    before_action :require_login, except: [:index, :show]
    
    def index 
        @events = Event.all
        find_group if params[:group_id]
    end
    
    def show
        find_event
    end 

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.group.user == current_user
            if @event.save
                redirect_to group_path(@event.group)
            else 
                render :new
            end
        else
            flash[:danger] = "You must be the group owner to create events."
            redirect_to '/'
        end
    end

    private 

    def find_group
        @group = Group.find(params[:group_id])
    end

    def find_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :location, :group_id, :starttime, :endtime)
    end
end
