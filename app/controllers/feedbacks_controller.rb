class FeedbacksController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @feedbacks = Feedback.all
    end

    def new
        @feedback = Feedback.new
    end
    
end
