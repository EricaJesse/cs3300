# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :user, optional: true
  has_many :characters, dependent: :destroy
  accepts_nested_attributes_for :characters, allow_destroy: true, reject_if: :all_blank

  # Add your existing validations, if any, and include the following line
  validates :rating, inclusion: { in: 1..10, message: "must be between 1 and 10" }
  
  # Add any other validations you may have for the other fields, e.g., title, author, etc.
  validates :title, presence: true
  validates :author, presence: true
  
end
