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

  validates :name, presence: true, length: { minimum: 1, maximum: 80 }

  validates :surename, presence: false, allow_blank: true, length: { maximum: 80 }

  validates :patronymic, presence: false, allow_blank: true, length: { maximum: 80 }

  validates :post, presence: true, length: { minimum: 5, maximum: 150 }

  validates :email, presence: true, format: { with: /\A^([a-z0-9\-_.]*)@([a-z0-9\-_.]*)$\z/ }, length: { maximum: 100 }

  validates :password, presence: true, length: { minimum: 6, maximum: 64 } if @save_unit

  validates :encrypted_password, presence: true, length: { minimum: 6, maximum: 64 } if @save_unit

  validates :secondary_email, presence: false, allow_blank: true, format: { with: /\A^([a-z0-9\-_.]*)@([a-z0-9\-_.]*)$\z/ }, length: { maximum: 100 }

  validates :primary_phone_number, presence: true, format: { with: /\A^[+][0-9]{12}$\z/ } if @save_unit

  validates :secondary_phone_number, presence: true, allow_blank: true, format: { with: /\A^[+][0-9]{12}$\z/ }

  validates :short_phone_nunber, presence: true, allow_blank: true, format: { with: /\A^[+][0-9]{12}$\z/ } if @save_unit

  validates :fax, presence: true, allow_blank: true, format: { with: /\A^[+][0-9]{12}$\z/ }

  validates :home_phone_number, presence: true, allow_blank: true, format: { with: /\A^[+][0-9]{12}$\z/ }

  validates :web_page, presence: true, allow_blank: true, format: { with: /\A^(http|https):[\/]{2}+([0-9a-zа-я\-_]*+[\/]*+[.]*)*$\z/ }, length: { maximum: 150 }
  validates :start_work, presence: true if @save_unit
  validates :finish_work, presence: true if @save_unit
  validates :working_days, presence: true if @save_unit
  validates :birthday, presence: true, allow_blank: true if @save_unit
  validates :characteristic, length: { maximum: 2000 }, allow_blank: true

  before_save :initial_unit_roles
  def initial_unit_roles
    if Unit.first.nil?
      self.role = 'global_admin'
    elsif role.nil?
      self.role = 'organization_admin'
    end
  end

  def self.set_public_for_organization(organization_id, public_unit_id)
    if where(organization_id: organization_id.to_s).update(public_for_organization: false) && where(id: public_unit_id.to_s).update(public_for_organization: true)
      true
    end
  end

  def self.unset_public_for_organization(organization_id)
    if where(organization_id: organization_id.to_s).update(public_for_organization: false)
      true
    end
  end

  def self.set_public_for_departament(departament_id, public_unit_id)
    if where(departament_id: departament_id.to_s).update(public_for_departament: false) && where(id: public_unit_id.to_s).update(public_for_departament: true)
      true
    end
  end

  def self.unset_public_for_departament(departament_id)
    if where(departament_id: departament_id.to_s).update(public_for_departament: false)
      true
    end
  end
end
