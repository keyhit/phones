class Unit < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :branche
  belongs_to :organization
  belongs_to :departament
  attr_accessor :unitphoto
  mount_uploader :unitphoto, UnitphotoUploader
end 
