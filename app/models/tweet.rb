class Tweet < ApplicationRecord
  belongs_to :user
  validates :text, presence: true
  self.per_page = 5

  def self.for_users(user_ids)
  	where(user_id: user_ids)
  end
end
