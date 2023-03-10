class Appointment < ApplicationRecord
  belongs_to :user

  validates :title, :description, :start_time, :end_time, :user_id, presence: true
  validates_associated :user
  validates :end_time, comparison: { greater_than: :start_time }
end
