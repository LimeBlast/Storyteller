class Story < ActiveRecord::Base
  include PublicActivity::Model
  tracked

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
