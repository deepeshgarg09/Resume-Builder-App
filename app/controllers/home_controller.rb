class HomeController < ApplicationController

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      # @profile = User.find(session[:user_id])
    end  
  end

  def edit
    logged_in_user
    if current_user
        @profile = current_user.profile
    end
  end

  private
      def profile_params
          params.require(:profile).permit(:name, :job_title, :total_experience, :overview, 
              :career_highlights, :primary_skills, :secondary_skills,
              :experiences_attributes => [ :id, :company, :position, :description, :start, :end, :_destroy],
              :projects_attributes => [ :id, :title, :project_url, :description, :tech_stack, :_destroy],
              :educations_attributes => [ :id, :school, :degree, :description, :start, :end, :_destroy]
          )
      end

end
