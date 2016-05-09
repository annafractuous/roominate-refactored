# cleanliness questions
Question.create(
  user_text: "How clean are you in the kitchen?",
  match_text: "How clean should your roommate be in the kitchen?",
  answers: { 1 => "Hoarder", 2 => "Controlled Mess", 3 => "Average", 4 => "Presentable", 5 => "Museum" }
)
Question.create(
  user_text: "How clean do you keep the bathroom?",
  match_text: "How clean should your roommate keep the bathroom?",
  answers: { 1 => "Hoarder", 2 => "Controlled Mess", 3 => "Average", 4 => "Presentable", 5 => "Museum" }
)
Question.create(
  user_text: "How tidy are you with common spaces?",
  match_text: "How tidy should your roommate keep common areas?",
  answers: { 1 => "Hoarder", 2 => "Controlled Mess", 3 => "Average", 4 => "Presentable", 5 => "Museum" }
)


# schedule questions
Question.create(
  user_text: "What's your work schedule?",
  match_text: "Your ideal roommate's work schedule is:",
  answers: { 1 => "Unemployed", 2=> "Remote/Freelance", 3 => "9-5", 4 => "Nights", 5 => "Workaholic" }
)
Question.create(
  user_text: "What's your sleep schedule like?",
  match_text: "What's your ideal roommate's sleep schedule?",
  answers: { 1 => "Responsible Adult", 2 => "Late Riser", 3 => "Nocturnal", 4 => "Daytime Sleeper", 5 => "Never Sleep" }
)
Question.create(
  user_text: "What's your peak bathroom time?",
  match_text: "You'd prefer a roommate whose peak bathroom hours are:",
  answers: { 1 => "Before 6am", 2 => "6-7", 3 => "7-8", 4 => "8-10", 5 => "Evening Showerer" }
)
Question.create(
  user_text: "How much time do you spend in the kitchen?",
  match_text: "You'd prefer a roommate who cooks:",
  answers: { 1 => "Never", 2 => "Prepared Foods", 3 => "Sometimes", 4 => "Most Nights", 5 => "like Anthony Bourdain" }
)


# habit questions
Question.create(
  user_text: "How do you feel about parties at home?",
  match_text: "What should your ideal roommate's attitude be towards parties?",
  answers: { 1 => "Never", 2 => "Rarely", 3 => "Occasionally", 4 => "Frequently", 5 => "like Fear and Loathing" }
)
Question.create(
  user_text: "How often do you imbibe?",
  match_text: "How frequently would your ideal roommate imbibe?",
  answers: { 1 => "Never", 2 => "Rarely", 3 => "Occasionally", 4 => "Frequently", 5 => "like Fear and Loathing" }
)
Question.create(
  user_text: "How 420-enthusiastic are you?",
  match_text: "How 420-friendly should your roommate be?",
  answers: { 1 => "Never", 2 => "Rarely", 3 => "Occasionally", 4 => "Frequently", 5 => "Cheech and Chong" }
)
Question.create(
  user_text: "Overnight visitors: 'my home is my space', or 'open door policy'? You have guests over:",
  match_text: "Your ideal roommate would have visitors over:",
  answers: { 1 => "Never", 2 => "Rarely", 3 => "Occasionally", 4 => "Regularly", 5 => "Never Alone" }
)
Question.create(
  user_text: "Is music meant for blasting? What's your usual jam?",
  match_text: "How should your ideal roommate feel about music?",
  answers: { 1 => "What's music?", 2 => "Strictly headphones", 3 => "Raise the roof sometimes", 4 => "Rock out regularly", 5 => "In a Band" }
)
