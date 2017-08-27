class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string  :name
      t.string  :subordinated
      t.string  :country
      t.string  :state
      t.string  :region
      t.string  :town
      t.string  :street
      t.string  :build
      t.string  :block
      t.string  :office
      t.string  :web_page
      t.string  :our_skils
      t.string  :organizationlogotype
      t.string  :public_presentation_user_id
      t.integer :branch_id, foreign_key: true

      t.timestamps
    end
  end
end
