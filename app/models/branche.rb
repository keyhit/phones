class Branche < ApplicationRecord
  has_many :organizations, dependent: :destroy
  has_many :departaments
  has_many :units

  validates :branch_name, presence: true,
                      length: { minimum: 5, maximum: 20 }
end

