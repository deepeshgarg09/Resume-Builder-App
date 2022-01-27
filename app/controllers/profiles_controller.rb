class ProfilesController < ApplicationController
    include HomeHelper
    include ProfilesHelper

    before_action :logged_in_user, only: [:update]
    before_action :correct_user,   only: [:update]

    def update
        updated_profile_params = update_array_attributes_in_params(profile_params)
        @profile = current_user.profile 
        @profile.save
        if @profile.update(updated_profile_params)
            @profile.save
            # flash[:success] = "Profile updated successfully."
            redirect_to root_path
        else
            flash[:danger] = "Profile update failed."
            redirect_to root_path
        end
    end

    def correct_user
        @profile = current_user.profile 
        @profile.save
        @user = current_user
        # redirect_to(root_url) unless @user == current_user
    end

    private
        def profile_params
            params.require(:profile).permit(:name, :job_title, :total_experience, :overview, 
                :career_highlights, :primary_skills, :secondary_skills, :avatar,
                :experiences_attributes => [ :id, :company, :position, :description, :start, :end, :_destroy],
                :projects_attributes => [ :id, :title, :project_url, :description, :tech_stack, :_destroy],            
                :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy]
            )
        end
end
