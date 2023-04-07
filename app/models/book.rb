class Book < ApplicationRecord
    # Add your existing validations, if any, and include the following line
    validates :rating, inclusion: { in: 1..10, message: "must be between 1 and 10" }
  end
  

 # app/models/book.rb
class Book < ApplicationRecord
  has_many :characters, dependent: :destroy
  accepts_nested_attributes_for :characters, allow_destroy: true, reject_if: :all_blank
  # ...
end

  