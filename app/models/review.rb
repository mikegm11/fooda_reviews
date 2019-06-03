class Review < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :user

  belongs_to :item

  # Indirect associations

  # Validations

end
