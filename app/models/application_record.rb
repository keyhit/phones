class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_branch(search)
    if search != ''
      where('branch_name LIKE ?', "%#{search}%")
    end
  end

  def self.search_organization(search)
    if search !=''
      where('name LIKE ? OR subordinated LIKE ? OR country LIKE ? OR state LIKE ? OR region LIKE ? OR town LIKE ? OR street LIKE ? OR build LIKE ? OR block LIKE ? OR office LIKE ? OR web_page LIKE ? OR our_skils LIKE ? OR public_unit_id LIKE ? OR branch_id LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end
  def self.search_departament(search)
    if search !=''
      where('departament_name LIKE ? OR departament_description LIKE ? OR departamentlogotype LIKE ? OR subordinated LIKE ? OR branch_id LIKE ? OR organization_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end

  def self.search_public_organization_units(search)
    if search !=''
      where('(name LIKE ? OR surename LIKE ? OR patronimic LIKE ? OR post LIKE ?  OR email LIKE ? OR primary_phone_number LIKE ? OR unitphoto LIKE ? OR characteristic LIKE ? OR branch_id LIKE ? OR organization_id LIKE ? OR departament_id LIKE ?) AND (public_for_organization = ?) ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", true)
    end
  end

  def self.search_public_departament_units(search)
    if search !=''
      where('(name LIKE ? OR surename LIKE ? OR patronimic LIKE ? OR post LIKE ?  OR email LIKE ? OR primary_phone_number LIKE ? OR unitphoto LIKE ? OR characteristic LIKE ? OR branch_id LIKE ? OR organization_id LIKE ? OR departament_id LIKE ?) AND (public_for_departament = ?) ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", true)
    end
  end

  def self.global_search_unit(search)
    if search !=''
      where('name LIKE ? OR surename LIKE ? OR patronimic LIKE ? OR post LIKE ?  OR email LIKE ? OR primary_phone_number LIKE ? OR unitphoto LIKE ? OR characteristic LIKE ? OR branch_id LIKE ? OR organization_id LIKE ? OR departament_id LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    end
  end

  def self.search_colegues(search, org_id)
    if search !=''
      where('name LIKE ? OR surename LIKE ? OR patronimic LIKE ? OR post LIKE ?  OR email LIKE ? OR primary_phone_number LIKE ? OR unitphoto LIKE ? OR characteristic LIKE ? OR branch_id LIKE ? OR organization_id LIKE ? OR departament_id LIKE ? ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").rewhere( organization_id: "#{org_id}")
    end
  end

  def self.search_info(search)
    if search !=''
      where('header LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%")
    end
  end
end
