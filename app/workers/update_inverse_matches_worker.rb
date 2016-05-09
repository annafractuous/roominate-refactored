class UpdateInverseMatchesWorker
  include Sidekiq::Worker

  def perform
    CompatibilityCalculator.update_inverse_match_scores
  end
end
