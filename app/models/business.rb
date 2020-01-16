class Business < ApplicationRecord
	has_many :locations, dependent: :destroy
	has_many :reports, dependent: :destroy
	validates :name, presence: { message: "Business Name is required" }
	validates :email, presence: { message: "Email is required" }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
