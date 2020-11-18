class GroupsController < ApplicationController
    before_action :require_login, except: [:index]

    def index
        @groups = Group.search(params[:search])
    end
    
    def show
        find_group
    end

    def new
        @group = Group.new
        @group.group_tags.build
    end 

    def edit
        find_group
        if current_user != find_group.user
            flash[:danger] = "You must be the group owner to edit group details."
            redirect_to '/'
        end
    end

    def create
        @group = Group.new(group_params)
        @group.tag_list = params[:group_tags][:tag_list]
        if @group.save
            redirect_to @group
        else
            render :new
        end
    end

    def update
        find_group 
        if @group.update(group_params)
            flash[:success] = "Group was updated successfully."
            redirect_to @group
        else 
            render 'edit'
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
        params.require(:group).permit(:topic_id, :user_id, :name, :description, :location, group_tags_attributes: [:tag_list]) 
    end 
end
