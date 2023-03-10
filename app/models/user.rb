class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy

  validates :email,
            format: { with: /\A([\w.%+-]+)@([\w-]+\.)+(\w{2,})\z/i, message: 'Please enter a valid email address' }
end
