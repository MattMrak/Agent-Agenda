class FeedbacksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @feedbacks = Feedback.all
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

    private
    def feedback_params
        params.require(:feedback).permit(:notes,:mission_id)
    end

end
