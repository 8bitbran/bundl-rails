class GroupsController < ApplicationController
    before_action :require_login, except: [:index, :show]

    def index
        @groups = Group.all
    end
    
    def show
        find_group
    end

    def new
        @group = Group.new
    end 

    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        if @group.save
            redirect_to @group
        else
            render :new
        end
    end

    private

    def find_group
        @group = Group.find(params[:id])
    end

    def group_params 
        params.require(:group).permit(:name, :description, :location)
    end 
end
