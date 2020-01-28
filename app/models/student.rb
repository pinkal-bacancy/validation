class Student < ApplicationRecord

	validates :username, presence: true
  # validates_with CustomValidator

  # validate do |student|
  #   CustomValidator.new(student).validate
  # end

  validates_each :first_name, :last_name do |record, attr, value|
    record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  end

  # conditional validation
  # validates :last_name, presence: true, if: :first_name?

   validates :last_name, presence: { message: "must be present" },
                    if: Proc.new { |s| s.first_name? },
                    unless: Proc.new { |c| c.username? } 

  # def first_name?
  #   first_name.present?
  # end


  #grouping conditions
  # with_options if: :username? do |student|
  #   student.validates :password, length: { minimum: 10 }
  #   student.validates :password_confirmation, presence: true
  # end

  #validate the checkbox 
	validates :terms_and_conditions, acceptance: true
	# validates :is_true,presence: true, acceptance: { accept: "1"}
  validates :password, confirmation: true, length: {minimum: 6, message: "Please enter at least 6 characters."}
	validates :password_confirmation, presence: true

  validates :contact_no, length: { is: 10 }, allow_blank: true

  validates :username, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, on: :update

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