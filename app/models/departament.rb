class Departament < ApplicationRecord
  belongs_to :branche
  belongs_to :organization
  has_many :units, dependent: :destroy
  attr_accessor :departamentlogotype
  mount_uploader :departamentlogotype, DepartamentlogotypeUploader
end 
