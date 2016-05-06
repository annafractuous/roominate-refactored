# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  question_id    :integer
#  answer         :integer
#  desired_answer :integer          default("{}"), is an Array
#  importance     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  category_id    :integer
#

class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :category
end
