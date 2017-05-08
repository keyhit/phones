class Unit < ApplicationRecord
  belongs_to :organization
  belongs_to :departament
  attr_accessor :unitphoto
  mount_uploader :unitphoto, UnitphotoUploader
end
