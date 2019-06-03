class Item < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :restaurant

  # Indirect associations

  # Validations

end
