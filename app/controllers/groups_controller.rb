class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end
    
    def show
        find_group
    end

    private

    def find_group
        @group = Group.find(params[:id])
    end
end
