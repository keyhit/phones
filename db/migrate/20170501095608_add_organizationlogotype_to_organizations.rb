class AddOrganizationlogotypeToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :organizationlogotype, :string
  end
end
