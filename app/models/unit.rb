class Unit < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :branch, optional: true
  belongs_to :organization, optional: true
  belongs_to :departament, optional: true
  attr_accessor :unitphoto
  mount_uploader :unitphoto, UnitphotoUploader

  before_save :initial_unit_roles
  def initial_unit_roles
    if Unit.first.nil?
      self.role = 'global_admin'
    elsif self.role.nil?
      self.role = 'organization_admin'
    end
  end

  def self.set_public_for_organization(organization_id, public_unit_id)
    if self.where(organization_id: "#{ organization_id }").update(public_for_organization: false) && self.where(id: "#{ public_unit_id }").update(public_for_organization: true)
      return true
    end
  end

  def self.unset_public_for_organization(organization_id)
    if self.where(organization_id: "#{ organization_id }").update(public_for_organization: false)
      return true
    end
  end

  def self.set_public_for_departament(departament_id, public_unit_id)
    if self.where(departament_id: "#{ departament_id }").update(public_for_departament: false) && self.where(id: "#{ public_unit_id }").update(public_for_departament: true)
      return true
    end
  end

  def self.unset_public_for_departament(departament_id)
    if self.where(departament_id: "#{ departament_id }").update(public_for_departament: false)
      return true
    end
  end
end
