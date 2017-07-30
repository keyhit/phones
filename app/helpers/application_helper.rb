module ApplicationHelper
  # Links
  def main_link
    link_to 'MAIN', branches_path()
  end

  def add_company_link
    link_to 'ADD COMPANY', branches_path()
  end

  def all_companies_link
    link_to 'ALL COMPANIES', branches_path()
  end

  def departaments_link
    link_to 'DEPARTAMENTS', branch_organization_departaments_path(branch, organization)
  end

  def my_company_link
    link_to 'MY COMPANY', branch_organization_path(id: organization.id)
  end

  def new_departament_link
    link_to 'NEW DEPARTAMENT', new_branch_organization_departament_path()
  end

  def all_departaments_link
    link_to 'ALL DEPARTAMENTS', branch_organization_departaments_path()
  end

  def all_departaments_units_link
    link_to 'ALL DEPARTAMENT UNITS', branch_organization_departament_units_path(departament_id: departament.id)
  end

  def add_new_unit_link
    link_to 'ADD NEW UNIT', new_branch_organization_departament_unit_path(departament_id: departament.id)
  end

  def all_units_of_departament_link
    link_to 'ALL UNITS OF DEPARTAMENT ', branch_organization_departament_units_path()
  end

  def admin_branches_link
    link_to 'ADMIN BRANCHES', admin_branches_path()
  end

  def add_branch_link
    link_to 'ADD BRANCH', new_branch_path()
  end

  def select_branch
    link_to 'SELECT BRANCH', new_branch_path()
  end

end
