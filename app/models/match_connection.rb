# == Schema Information
#
# Table name: match_connections
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  match_id   :integer
#  score      :integer
#  interested :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MatchConnection < ActiveRecord::Base
  belongs_to :user
  belongs_to :match, class_name: "User"

  validates_uniqueness_of :user_id, :scope => :match_id

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverse, if: :has_inverse?
  after_update :update_inverse

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def update_inverse
    inverse.score = self.score
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverse
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { match_id: user_id, user_id: match_id }
  end

end
