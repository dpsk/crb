class Advert < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

end
