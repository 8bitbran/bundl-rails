class GroupsController < ApplicationController
    def show
        find_group
    end

    private

    def find_group
        @group = Group.find(params[:id])
    end
end
