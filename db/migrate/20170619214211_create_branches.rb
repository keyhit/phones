class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string :branch_name_en
      t.string :branch_name_ru
      t.string :branch_name_uk
      t.timestamps
    end
  end
end
