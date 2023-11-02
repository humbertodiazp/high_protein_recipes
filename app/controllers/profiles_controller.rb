
class ProfilesController < ApplicationController
    before_action :set_profile
    before_action :authenticate_user!

    def edit
        @profile = current_user.profile || current_user.build_profile
        render layout: 'no_nav'
    end

    def create
        @profile = current_user.build_profile(profile_params)
        if @profile.save
        redirect_to @profile
        else
        render :new, layout: 'no_nav'
        end
        render layout: 'no_nav'
    end
    
    def update
        if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
        else
        render :edit, layout: 'no_nav'
        end
    end
    
    # Other actions and private methods here
    
    private
    
    def set_profile
        @profile = current_user.profile || current_user.build_profile
    end
    
    def profile_params
        params.require(:profile).permit(:name, :location, :link, :bio, :image)
    end
end
    