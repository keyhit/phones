class Branch < ApplicationRecord
  has_many :organizations, dependent: :destroy
  has_many :departaments
  has_many :units

  validates :branch_name_en, presence: true,
                             length: { minimum: 3, maximum: 120 }
  validates :branch_name_ru, presence: true,
                             length: { minimum: 3, maximum: 120 }
  validates :branch_name_uk, presence: true,
                             length: { minimum: 3, maximum: 120 }
  validates :branch_name_en, uniqueness: true
  validates :branch_name_ru, uniqueness: true
  validates :branch_name_uk, uniqueness: true

  before_save :upcase_branch_name_en
  before_save :upcase_branch_name_ru
  before_save :upcase_branch_name_uk

  def upcase_branch_name_en
    branch_name_en.upcase!
  end

  def upcase_branch_name_ru
    branch_name_ru.upcase!
  end

  def upcase_branch_name_uk
    branch_name_uk.upcase!
  end
end
