class CreateBranches < ActiveRecord::Migration[5.0]
  def change
    create_table :branches do |t|
      t.string  :branch_name_en
      t.string  :branch_name_ru
      t.string  :branch_name_uk
      t.string  :subordinated
      t.integer :subordinated_id
      t.boolean :hidden, default: false
      t.boolean :blocked, default: false
      t.timestamps
    end
  end
end
