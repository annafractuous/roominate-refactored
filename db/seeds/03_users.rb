# USERS

200.times do
  User.create(
    name: Faker::Name.name,
    birthday: Faker::Date.between(32.years.ago, 24.years.ago),
    gender: ["M", "F"].sample,
    max_rent: "1000-1250",
    city: ["New York City", "Pittsburgh"].sample,
    desired_gender: ["M", "F", "Any"].sample,
    desired_age_range: "24-32"
  )
end

# ANSWERS

all_users = User.all.to_a.shuffle

# CLEANLINESS

# clean seeking clean
set = all_users[0,24]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(4..5), desired_answer: [4,5], importance: rand(2..4))
  end
end

# clean seeking average
set = all_users[25,49]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(4..5), desired_answer: [2,3], importance: rand(2..4))
  end
end

# messy seeking messy
set = all_users[50,74]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(1..2), desired_answer: [1,2], importance: rand(2..4))
  end
end

# messy seeking average
set = all_users[75,99]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(1..2), desired_answer: [2,3,4], importance: rand(2..4))
  end
end

# average seeking average
set = all_users[100,159]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(2..4), desired_answer: [2,3,4], importance: rand(2..4))
  end
end

# average seeking clean
set = all_users[160,199]
set.each do |user|
  [1,2,3].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 1, answer: rand(2..4), desired_answer: [3,4,5], importance: rand(2..4))
  end
end

# SCHEDULE

all_users = User.all.to_a.shuffle

# responsible adults with regular schedules seeking roommates they can hang out with
set = all_users[0,49]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 3, desired_answer: [2,3], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: 1, desired_answer: [1,2], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(1..3), desired_answer: [1,4,5], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(1..5), desired_answer: [1,2,3,4], importance: rand(2..4))
end

# responsible adults with regular schedules seeking roommates they'll rarely see
set = all_users[50,99]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 3, desired_answer: [4,5], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: 1, desired_answer: [2,3,4], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(1..3), desired_answer: [4,5], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(1..5), desired_answer: [1,2,3], importance: rand(2..4))
end

# late-rising freelancers seeking roommates they can hang out with
set = all_users[100,129]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 2, desired_answer: [2,3], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: rand(2..3), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(4..5), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(2..5), desired_answer: [2,3,4,5], importance: rand(2..4))
end

# late-rising freelancers seeking roommates they'll rarely see
set = all_users[130,159]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 2, desired_answer: [3,4,5], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: rand(2..3), desired_answer: [1,4], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(4..5), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(2..5), desired_answer: [1,2,3], importance: rand(2..4))
end

# night shift daytime sleepers seeking roommates they can hang out with
set = all_users[160,179]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 4, desired_answer: [2,4], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: rand(3..5), desired_answer: [3,4,5], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(4..5), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(2..5), desired_answer: [2,3,4,5], importance: rand(2..4))
end

# night shift daytime sleepers seeking roommates they'll rarely see
set = all_users[180,199]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 2, answer: 4, desired_answer: [2,3,5], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 2, answer: rand(3..5), desired_answer: [1,2], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 2, answer: rand(4..5), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 2, answer: rand(2..4), desired_answer: [1,2,3], importance: rand(2..4))
end

# HABITS

all_users = User.all.to_a.shuffle

# people who like to drink/party & have people over
set = all_users[0,29]
set.each do |user|
  [1,2,3,4,5].each do |q_id|
    user.answers.create(question_id: q_id, category_id: 3, answer: rand(3..5), desired_answer: [3,4,5], importance: rand(2..4))
  end
end

# people who like to drink/party moderately but not at home
set = all_users[30,129]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 3, answer: rand(1..3), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 3, answer: rand(3..4), desired_answer: [2,3,4], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 3, answer: rand(3..4), desired_answer: [2,3,4], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 3, answer: rand(2..5), desired_answer: [2,3,4], importance: rand(2..4))
  user.answers.create(question_id: 5, category_id: 3, answer: rand(2..5), desired_answer: [2,3,4], importance: rand(2..4))
end

# people who don't really like to drink/party
set = all_users[130,199]
set.each do |user|
  user.answers.create(question_id: 1, category_id: 3, answer: rand(1..2), desired_answer: [1,2], importance: rand(2..4))
  user.answers.create(question_id: 2, category_id: 3, answer: rand(1..2), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 3, category_id: 3, answer: rand(1..2), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 4, category_id: 3, answer: rand(1..3), desired_answer: [1,2,3], importance: rand(2..4))
  user.answers.create(question_id: 5, category_id: 3, answer: rand(1..3), desired_answer: [1,2,3], importance: rand(2..4))
end
