class Organization < ApplicationRecord
  belongs_to :branch, optional: true
  has_many :departaments, dependent: :destroy
  has_many :units
  attr_accessor :organizationlogotype
  mount_uploader :organizationlogotype, OrganizationlogotypeUploader

  before_update :find_departament_by_organization_id
  after_update :update_departament_branch_id
  before_update :find_units_by_organization_id
  after_update :update_unit_branch_id

  def find_units_by_organization_id
    @units = Unit.find_by(organization_id: self.id)
  end

  def update_unit_branch_id
    @units.update(branch_id: self.branch_id)
  end

  def find_departament_by_organization_id
    @departaments = Departament.find_by(organization_id: self.id)
  end

  def update_departament_branch_id
    @departaments.update(branch_id: self.branch_id)
  end
end
