class CompatibilityCalculator

  @@question_categories = Category.all

  def self.get_viable_users(user)
    city              = user.city
    max_rent          = user.max_rent + 50
    desired_genders   = user.desired_gender == "Any" ? ["M", "F", "Other"] : Array(user.desired_gender)
    desired_age_range = user.desired_birthday_range

    user.viable_users = User.where(:city => city, :max_rent => 0..max_rent, :gender => desired_genders, :birthday => desired_age_range).where.not(id: user.id)
  end


  def self.find_matches(user)
    set = user.viable_users || get_viable_users(user)

    set.each_with_object([]) do |match, matches|
      compatibility_score = run_match_calculations(user, match)
      connection = user.match_connections.find_or_create_by(match: match)
      connection.tap { |conn| conn.score = compatibility_score }.save
      matches << match if compatibility_score > 25
    end
  end


  def self.get_compat_score_for_category(user, match, category)
    category = Category.find_by(name: category.titleize) if category.class == String
    responses = Answer.where(:user_id => [user, match], :category => category)
    mutual_category_compatibility(user, match, responses)
  end


  def self.run_match_calculations(user, match)
    responses_by_category = organize_responses_by_category(user, match)
    category_scores = responses_by_category.values.each_with_object([]) do |category_responses, scores|
      scores << mutual_category_compatibility(user, match, category_responses)
    end
    calculate_compatibility_score(category_scores)
  end


  def self.organize_responses_by_category(user, match)
    responses_hash  = create_responses_category_skeleton
    @@question_categories.each_with_object(responses_hash) do |category|
      responses_hash[category.name] = Answer.where(:user_id => [user, match], :category => category)
    end
  end
  # responses = {
  #   "Cleanliness" = [all user & match cleanliness answers],
  #   "Schedule" = [all user & match schedule answers],
  #   ...
  # }


  def self.create_responses_category_skeleton
    @@question_categories.each_with_object({}) do |category, responses|
      responses[category.name] = []
    end
  end
  # responses = { "Cleanliness": [], "Schedule": [], "Habit": [] }


  def self.mutual_category_compatibility(user, match, responses)
    user_to_match_percentage = one_way_category_compatibility(user, match, responses)
    match_to_user_percentage = one_way_category_compatibility(match, user, responses)
    compatibility            = Math.sqrt(user_to_match_percentage * match_to_user_percentage).to_i
  end


  def self.one_way_category_compatibility(user, match, responses)
    user_answers, match_answers = organize_user_and_match_answers(responses, user.id)
    compatibility_score         = weigh_responses(user_answers, match_answers)
    # puts compatibility_score
    # compatibility_score
  end


  def self.organize_user_and_match_answers(responses, user_id)
    user_answers, match_answers  = {}, {}

    responses.each do |response|
      if response.user_id == user_id
        user_answers[response.question_id] = {
          # answer: response.answer,
          importance: response.importance,
          desired_answers: response.desired_answer
        }
      else
        match_answers[response.question_id] = response.answer
      end
    end
    return user_answers, match_answers
  end
  # user_answers = {
  #  1 = {importance: 2, desired_answers: [2,3,4]},
  #  2 = {importance: 1, desired_answers: [4,5]}
  # }
  # match_answers = { 1 => 3, 2 => 1 }


  def self.weigh_responses(user_answers, match_answers)
    conversion_hash = { 1 => 0, 2 => 1, 3 => 10, 4 => 250 }
    total_possible_points = 0
    points_earned = 0

    user_answers.each do |question, answer|
      weighted_points = conversion_hash[answer[:importance]]
      total_possible_points += weighted_points
      points_earned += weighted_points if answer[:desired_answers].include?(match_answers[question])
      # puts "user answer: #{answer}"
      # puts "match answer: #{match_answers[question]}"
    end
    total_possible_points != 0 ? (points_earned / total_possible_points.to_f * 100).to_i : 1
  end


  def self.calculate_compatibility_score(scores_array)
    if scores_array.size <= 2
      score = Math.sqrt(scores_array.first * scores_array.last.to_f).to_i
      score == 0 ? 1 : score
    else
      # puts "scores: #{scores_array}"
      first, second = scores_array.shift.to_f, scores_array.shift.to_f
      score_so_far = Math.sqrt(first * second).to_i
      score_so_far = 1 if score_so_far == 0
      scores_array.unshift(score_so_far)
      # puts "scores: #{scores_array}"
      calculate_compatibility_score(scores_array)
    end
  end

end
