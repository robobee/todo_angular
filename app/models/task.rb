class Task < ActiveRecord::Base
  validates :description, presence: true
  default_scope { order(:created_at => :desc) }
end
