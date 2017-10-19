module ApplicationHelper
  # Links
  def my_phones_link
    link_to 'MyPhones', branches_path
  end
  def admin_branches_link
    link_to (t 'admin_branches'), admin_branches_path
  end

  def add_branch_link
    link_to (t '.add_branch'), new_branch_path
  end

  def info_link
    link_to (t '.info'), infos_path()
  end

  def new_info_link
    link_to (t '.new_info'), new_info_path
  end

  def edit_info_link
    link_to (t '.edit_info'), info_path
  end

  def feedback_link
    link_to (t '.feedback'), new_feedback_path()
  end

  def main_link
    link_to (t '.main'), branches_path
  end

  def add_company_link
    link_to (t '.add_company'), new_branch_organization_path(branch_id: current_unit.branch_id)
  end

  def all_companies_link
    link_to (t '.all_companies'), branches_path
  end

  def departaments_link
    link_to (t '.departaments'), branch_organization_departaments_path(branch, organization)
  end

  def my_company_link
    link_to (t '.my_company'), branch_organization_path(id: organization.id)
  end

  def new_departament_link
    link_to (t '.new_departament'), new_branch_organization_departament_path
  end

  def all_departaments_link
    link_to (t '.all_departaments'), branch_organization_departaments_path
  end

  def all_departaments_units_link
    link_to (t '.add_departaments_unit'), branch_organization_departament_units_path(departament_id: departament.id)
  end

  def add_new_unit_link
    link_to (t '.add_new_unit'), new_branch_organization_departament_unit_path(departament_id: departament.id)
  end

  def all_units_of_departament_link
    link_to (t '.all_units_of_departament'), branch_organization_departament_units_path
  end

  def branch_name(unit_branch)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        unit_branch.branch_name_ru
      when 'en'
        unit_branch.branch_name_en
      when 'uk'
        unit_branch.branch_name_uk
      else
        unit_branch.branch_name_uk
      end
    else
      unit_branch.branch_name_uk
    end
  end

  def select_branch_name
    case current_unit.locale
    when 'en'
      Branch.all.collect { |p| [ p.branch_name_en, p.id ] }
    when 'ru'
      Branch.all.collect { |p| [ p.branch_name_ru, p.id ] }
    when 'uk'
      Branch.all.collect { |p| [ p.branch_name_uk, p.id ] }
    else
      Branch.all.collect { |p| [ p.branch_name_uk, p.id ] }
    end
  end

  def current_locale
    case current_unit.locale
    when 'en'
      t '.english_language'
    when 'ru'
      t '.russian_language'
    when 'uk'
      t '.ukraine_language'
    else
      t '.ukraine_language'
    end
  end

  def bootstrap_class_for_flash(flash_type)
    case flash_type
    when 'success'
     'alert-success'
    when 'error'
      'alert-warning'
    when 'alert'
      'alert-block'
    when' notice'
      'alert-info'
    else
      flash_type.to_s + "aa"
    end
  end

end
