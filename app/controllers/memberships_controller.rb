class MembershipsController < ApplicationController

    def create 
        @membership = current_user.memberships.build(membership_params)
        if @membership.save
            flash[:success] = "You joined the group."
            redirect_to group_path(membership_params[:group_id])
        else
            flash[:danger] = "Failed to join group. Please try again."
            redirect_to group_path(membership_params[:group_id])
        end
    end

    def destroy 
        @membership = Membership.find(params[:id])
        @membership.destroy
        redirect_to root_path
    end 

    private

    def membership_params
        params.require(:membership).permit(:group_id, user_id)
    end
end