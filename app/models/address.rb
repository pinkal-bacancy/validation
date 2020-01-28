class Address < ApplicationRecord
  belongs_to :student
  validates :student, presence: true
end
