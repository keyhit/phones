class Branche < ApplicationRecord
  has_many :organizations, dependent: :destroy
  has_many :departaments
  has_many :units

  validates :branch_name, presence: true,
                      length: { minimum: 5, maximum: 30 }

  before_save :upcase_branch_name
   def upcase_branch_name
    self.branch_name.upcase!
  end

  validates :branch_name, uniqueness: true


end

