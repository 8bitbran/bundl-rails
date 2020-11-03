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
        @group.group_tags.build
    end 

    def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        @group.tag_list = params[:group_tags][:tag_list]
        if @group.save
            redirect_to @group
        else
            render :new
        end
    end

    def destroy 
        @group = Group.find(params[:id])
        @group.destroy if current_user == @group.user
        flash[:notice] = "Your group has been permanently deleted. This cannot be undone."
        redirect_to groups_path
    end 

    private

    def find_group
        @group = Group.find(params[:id])
    end

    def group_params 
        params.require(:group).permit(:name, :description, :location, group_tags_attributes: [:tag_list]) 
    end 
end
