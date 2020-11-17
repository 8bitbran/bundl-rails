class DiscussionsController < ApplicationController
    before_action :require_login

    def index 
        @discussion = Discussion.new
        @discussions = Discussion.where(group_id: params[:group_id])
        @group = Group.find(params[:group_id])
    end

    def create 
        @discussion = current_user.discussions.build(discussion_params)
        if @discussion.save
            redirect_to group_discussions_path(@discussion.group)
        else
            flash[:danger] = "Failed to submit discussion post."
            redirect_to group_discussions_path(@discussion.group)
        end
    end

    def destroy
        @discussion = Discussion.find(params[:id])
        group = @discussion.group
        @discussion.destroy if @discussion.user == current_user
        flash[:success] = "You deleted a discussion post."
        redirect_to group
    end

    private

    def discussion_params
        params.require(:discussion).permit(:group_id, :user_id, :content)
    end
end