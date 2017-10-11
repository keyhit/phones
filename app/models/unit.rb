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
end
