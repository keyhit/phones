class Info < ApplicationRecord
  attr_accessor :myPhoto
  mount_uploader :myPhoto, MyPhotoUploader
end
