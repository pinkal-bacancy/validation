class Student < ApplicationRecord
	validates :username, presence: true

  #validate the checkbox 
	validates :terms_and_conditions, acceptance: true
	# validates :is_true,presence: true, acceptance: { accept: "1"}
  validates :password, confirmation: true, length: {minimum: 6, message: "Please enter at least 6 characters."}
	validates :password_confirmation, presence: true

  validates :username, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  validates :email,uniqueness: true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  # validates :email,uniqueness: { scope: :username, message: "Should one per user" }, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }

  #by default message will be Username is reserved.
  validates :username, exclusion: { in: %w(about account root etc..),
    message: "%{value} is reserved." }

  # validates :age, inclusion: { in: 15..30,
  #   message: "%{value} is not a valid age" }

  validates :age, numericality: { only_integer: true , greater_than: 0 }, allow_nil: true
  # has_one :address
  # validates_associated :address
end