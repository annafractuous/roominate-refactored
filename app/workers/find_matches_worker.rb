class FindMatchesWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    CompatibilityCalculator.find_matches(user)
  end
end
