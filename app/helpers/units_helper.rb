module UnitsHelper
  def redirect_to_units
    @redirect_to_units = redirect_to branch_organization_departament_units_path(branch, organization, departament)
  end

  def redirect_to_unit
    @redirect_to_units = edirect_to new_branch_organization_departament_unit_path(branch, organization, departament, unit)
  end
end
