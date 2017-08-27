class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string     :header
      t.string     :text
      t.string     :myPhoto
      t.timestamps
    end
  end
end
