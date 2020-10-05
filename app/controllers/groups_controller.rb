class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    
    def show
        find_group
    end

    def new
    end 

    def create
        @group = Group.new(group_params)
        @group.save
        redirect_to @group
    end

    private

    def find_group
        @group = Group.find(params[:id])
    end

    def group_params 
        params.require(:group).permit(:name, :description, :location)
    end 
end
