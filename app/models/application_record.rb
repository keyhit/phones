class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search_branch(search)
    if search != ''
      where('branch_name_en ILIKE ? OR branch_name_ru ILIKE ? OR branch_name_uk ILIKE ?', '%' + search + '%', '%' + search + '%', '%' + search + '%')
    end
  end

  def self.search_organization(search)
    if search !=''
      where('name ILIKE ? OR subordinated ILIKE ? OR country ILIKE ? OR state ILIKE ? OR region ILIKE ? OR town ILIKE ? OR street ILIKE ? OR build ILIKE ? OR block ILIKE ? OR office ILIKE ? OR web_page ILIKE ? OR our_skils ILIKE ? ', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%')
    end
  end
  def self.search_departament(search)
    if search !=''
      where('departament_name ILIKE ? OR departament_description ILIKE ? OR departamentlogotype ILIKE ? OR subordinated ILIKE ? ', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%')
    end
  end

  def self.search_public_organization_units(search)
    if search !=''
      where('(name ILIKE ? OR surename ILIKE ? OR patronymic ILIKE ? OR post ILIKE ?  OR email ILIKE ? OR primary_phone_number ILIKE ? OR unitphoto ILIKE ? OR characteristic ILIKE ? ) AND (public_for_organization = ?) ', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', true)
    end
  end

  def self.search_public_departament_units(search)
    if search !=''
      where('(name ILIKE ? OR surename ILIKE ? OR patronymic ILIKE ? OR post ILIKE ?  OR email ILIKE ? OR primary_phone_number ILIKE ? OR unitphoto ILIKE ? OR characteristic ILIKE ? ) AND (public_for_departament = ?)', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', true)
    end
  end

  def self.global_search_unit(search)
    if search !=''
      where('name ILIKE ? OR surename ILIKE ? OR patronymic ILIKE ? OR post ILIKE ?  OR email ILIKE ? OR primary_phone_number ILIKE ? OR unitphoto ILIKE ? OR characteristic ILIKE ?', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%')
    end
  end

  def self.search_colegues(search, org_id)
    if search !=''
      where('name ILIKE ? OR surename ILIKE ? OR patronymic ILIKE ? OR post ILIKE ?  OR email ILIKE ? OR primary_phone_number ILIKE ? OR unitphoto ILIKE ? OR characteristic ILIKE ?', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%').rewhere( organization_id: "#{org_id}")
    end
  end

  def self.search_info(search)
    if search !=''
      where('great_header_ru ILIKE ? OR great_header_uk ILIKE ? OR header_en ILIKE ? OR text_en ILIKE ? OR header_ru ILIKE ? OR text_ru ILIKE ? OR header_uk ILIKE ? OR text_uk ILIKE ?', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%', '%' + search + '%')
    end
  end
end
