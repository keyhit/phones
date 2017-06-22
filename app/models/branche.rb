class Branche < ApplicationRecord
  has_many :organizations, dependent: :destroy
  has_many :departaments
  has_many :units
end
 