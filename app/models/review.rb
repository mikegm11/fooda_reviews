class Review < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :item

  # Indirect associations

  # Validations

end
