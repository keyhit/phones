module UnitsHelper
  def redirect_to_units
    @redirect_to_units = redirect_to branch_organization_departament_units_path(branch, organization, departament)
  end

  def redirect_to_unit
    @redirect_to_units = edirect_to new_branch_organization_departament_unit_path(branch, organization, departament, unit)
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
end
