class Student < ApplicationRecord
	validates :username, presence: true
	validates :terms_and_conditions, acceptance: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
end