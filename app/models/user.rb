# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  birthday        :date
#  gender          :string
#  city            :string
#  max_rent        :integer
#  desired_gender  :string
#  desired_max_age :integer
#  desired_min_age :integer
#  move_in         :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :answers
  has_many :match_connections
  has_many :matches, through: :match_connections, dependent: :destroy

  def age
    (Date.today - self.birthday).to_i/365
  end

  def desired_birthday_range
    age_range = self.desired_age_range.split("-").map(&:to_i) # [24,32]
    (Date.today - age_range.last.years)..(Date.today - age_range.first.years)
  end

  def good_matches
    MatchConnection.joins(:user).where("match_connections.user_id = ? AND match_connections.score > ?", self.id, 25).map { |conn| conn.match }
  end

  def find_matches
    CompatibilityCalculator.find_matches(self)
  end

end
