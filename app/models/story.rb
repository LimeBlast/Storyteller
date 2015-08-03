class Story < ActiveRecord::Base
  include PublicActivity::Model

  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil },
          title: Proc.new { |controller, model| model.title },
          diff:  Proc.new { |controller, model| model.changes.empty? ? nil : model.changes.except(:id, :created_at, :updated_at).to_yaml }

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
