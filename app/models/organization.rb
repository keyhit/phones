class Organization < ApplicationRecord
  has_many :departaments, dependent: :destroy
  has_many :units
  attr_accessor :organizationlogotype
  mount_uploader :organizationlogotype, OrganizationlogotypeUploader
end
