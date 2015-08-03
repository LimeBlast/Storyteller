class Story < ActiveRecord::Base
  include PublicActivity::Model

  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
