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
            flash[:success] = "You submitted your discussion post."
            redirect_to group_discussions_path(params[:group_id])
        else
            flash[:danger] = "Failed to submit discussion post."
            redirect_to group_discussions_path(params[:group_id])
        end
    end

    def destroy
        @discussion = Discussion.find(params[:id])
        @discussion.destroy if @discussion.user == current_user
        redirect_to root_path
    end

    private

    def discussion_params
        params.require(:discussion).permit(:group_id, :user_id, :content)
    end
end