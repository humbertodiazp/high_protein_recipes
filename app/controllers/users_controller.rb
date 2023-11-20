class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user

    def index
        @users = User.all
        @followers = @user.followers
    end

    # def new 
    #     @user = User.new
    # end


    def show
        @recipe = @user.recipes 
        @profile = @user.profile
        render layout: 'no_nav'
    end



    def followers 
        @follower = @user.active_relationships.map(&:follower)
        render layout: 'no_nav'
    end

    def following
        @following = @user.passive_relationships.map(&:followed)
        render layout: 'no_nav'
    end


    private

    def set_user
        @user = User.find(params[:id])
        @recipe = @user.recipes 
        @profile = @user.profile

    end

    # def set_recipes
    #     Recipe.where(['user_id = ?', @user.id])

    # end



    # def set_users
    #     User.where(['id not in (?)', follower_ids])
    #         .order('full_name DESC')
    #         .page(params[:page])
    # end

    # def set_recipes
    #     Recipe.where(['user_id = ?', @user.id])
    #         .order('created_at DESC')
    #         .page(params[:page])
    # end

    # def follower_ids
    #     current_user.follower.map(&:id) << current_user.id
    # end
end