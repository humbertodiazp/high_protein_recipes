class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # before_action :set_profile 

    def update
        if @user.update(profile_params)
            redirect_to @user, notice: 'Profile was successfully updated.'
        else
            render :edit
        end
    end

    def show
        @user = User.find(params[:id])
        @profile = @user.profile
        @recipes = @user.recipes

    end

    private
    # def set_profile
    #     @user = current_user.find(params[:id])
    # end

    def profile_params
        params.require(:profile).permit(:full_name, :location, :link, :bio, :image)
    end
end
