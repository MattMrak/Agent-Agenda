class MissionsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @mission = Mission.new
        @mission.build_category
    end

    def create
        @mission = current_user.missions.build(mission_params)
        if @mission.save
            redirect_to missions_path
        else
            render :new
        end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @missions = @user.missions
        else
            @missions = Mission.all
        end
    end

    def show
        @mission = Mission.find_by_id(params[:id])
        redirect_to missions_path if !@mission
    end

    private
    def mission_params
        params.require(:mission).permit(:operation,:objective, :category_id, category_attributes: [:name])
    end

end
