class RegistrationsController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        @user.profile = Profile.new
        
        if @user.save
            session[:user_id] = @user.id
            @user.profile.educations.create
            @user.profile.experiences.create
            @user.profile.projects.create
            redirect_to :controller => 'home', :action => 'edit', notice: "Successfully Signed Up!"
        else
            flash[:alert] = "Something went wrong!"
            render :new   
        end       
    end    

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end   
    
end        