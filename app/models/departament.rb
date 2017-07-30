class Departament < ApplicationRecord
  belongs_to :branch, optional: true
  belongs_to :organization, optional: true
  has_many :units, dependent: :destroy
  attr_accessor :departamentlogotype
  mount_uploader :departamentlogotype, DepartamentlogotypeUploader
end 
