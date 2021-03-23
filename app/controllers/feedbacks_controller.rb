class FeedbacksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        #check if its nested
        if params[:mission_id] && @mission = Mission.find_by_id(params[:mission_id]) #then its nested
            @feedbacks = @mission.feedbacks
        else
            @feedbacks = Feedback.all
        end
    end

    def new
        @feedback = Feedback.new
    end

    def create
        @feedback = current_user.feedbacks.build(feedback_params)
        if @feedback.save
            redirect_to feedbacks_path
        else
            render :new
        end
    end

    def show
        @feedback = Feedback.find_by(id: params[:id])
    end

    def edit
        @feedback = Feedback.find_by(id: params[:id])
    end

    def update
        @feedback = Feedback.find_by(id: params[:id])
        if @feedback.update(feedback_params)
          redirect_to feedback_path(@feedback)
        else
          render :edit
        end
    end

    private
    def feedback_params
        params.require(:feedback).permit(:notes,:mission_id)
    end

end
