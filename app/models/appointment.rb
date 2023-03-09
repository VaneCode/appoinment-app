class Appointment < ApplicationRecord
    belongs_to :user

    validates :title, :description, :start_time, :end_time, :user_id, precense: true
    validates_associated :users
    validates :end_time, comparison: { greater_than: :start_time }
end
