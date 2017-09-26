module BranchesHelper
  def branch_name(branch)
    if unit_signed_in?
      case current_unit.locale
      when 'ru'
        branch.branch_name_ru
      when 'en'
        branch.branch_name_en
      when 'uk'
        branch.branch_name_uk
      else
        branch.branch_name_uk
      end
    else
      branch.branch_name_uk
    end
  end
end
