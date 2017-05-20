class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :full_name
      t.string :belong_to_departament
      t.string :post
      t.string :primary_email
      t.string :secondary_email
      t.string :primary_phone_number
      t.string :secondary_phone_number
      t.string :short_phone_nunber
      t.string :fax
      t.string :home_phone_number
      t.string :web_page
      t.string :start_work
      t.string :finish_work
      t.string :working_days
      t.date :birthday
      t.string :login
      t.string :password
      t.string :unitphoto
      t.string :characteristic
      t.references :departament, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
