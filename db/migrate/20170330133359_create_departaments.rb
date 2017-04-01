class CreateDepartaments < ActiveRecord::Migration[5.0]
  def change
    create_table :departaments do |t|
      t.string :departament_name
      t.string :departament_description
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
