class AnswersController < ApplicationController
  after_action :update_compatibility_scores, only: [:create, :update]

  def create
  end

  def edit
  end

  def update
    byebug
  end

  private

    def update_compatibility_scores
      FindMatchesWorker.perform_async(params[:user_id])
    end
    
end
