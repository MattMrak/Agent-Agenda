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
            @missions = @user.missions.alpha
        else
            @missions = Mission.alpha
        end
    end

    def edit
        @mission = Mission.find_by_id(params[:id])
        redirect_to missions_path if !@mission || @mission.user != current_user
        @mission.build_category if !@mission.category
    end

    def update
        @mission = Mission.find_by(id: params[:id])
        redirect_to missions_path if !@mission || @mission.user != current_user
       if @mission.update(mission_params)
         redirect_to mission_path(@mission)
       else
         render :edit
       end
    end

    def show
        @mission = Mission.find_by_id(params[:id])
        redirect_to missions_path if !@mission
    end

    def destroy
        @mission = Mission.find(params[:id])
        @mission.destroy
        redirect_to missions_path
    end

    private
    def mission_params
        params.require(:mission).permit(:operation,:objective, :category_id, category_attributes: [:urgency_level])
    end

end
