# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  belongs_to :category
end
