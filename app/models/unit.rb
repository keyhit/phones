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
end
