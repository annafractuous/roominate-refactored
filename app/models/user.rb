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
  has_many :matches, through: :match_connections

  # after_update :update_viable_users, if: :determining_factors_changed?

  attr_accessor :viable_users  # cache users who match desired city, age, gender, max rent

  def age
    (Date.today - self.birthday).to_i/365
  end

  def desired_birthday_range
    Date.today - desired_max_age.years..Date.today - desired_min_age.years
  end

  private

    def determining_factors_changed?

    end

    def update_viable_users
      CompatibilityCalculator.get_viable_users(self)
    end
end
