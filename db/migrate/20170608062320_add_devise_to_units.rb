class AddDeviseToUnits < ActiveRecord::Migration[5.0]
  def self.up
    create_table :units do |t|
      t.string :full_name
      t.string :belong_to_departament
      t.string :post
      t.string :email, null: false, default: ""
      t.string :secondary_email
      t.string :encrypted_password, null: false, default: ""
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
      # Hide user
      t.boolean :show_hide_for_units, default: false
      t.boolean :show_hide_for_visitors, default: false
      # Roles
      # CRUD all
      t.boolean :global_admin, default: false
      # CRU all
      t.boolean :global_moderator, default: false
      # CRUD only in native: orgamization, departament, unit 
      t.boolean :organization_admin, default: false
      # CRU only in native: orgamization, departament, unit
      t.boolean :organization_moderator, default: false
      # CRUD only in native: departament, unit
      t.boolean :departament_admin, default: false
      # CRU only in native: departament, unit
      t.boolean :departament_moderator, default: false
      # RU only in native unit
      t.boolean :units_admin, default: true
      ## Database authenticatable
      # t.string :email,              null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    add_index :units, :email,                unique: true
    add_index :units, :reset_password_token, unique: true
    # add_index :units, :confirmation_token,   unique: true
    # add_index :units, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
