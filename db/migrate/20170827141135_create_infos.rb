class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.string     :great_header_en
      t.string     :great_header_ru
      t.string     :great_header_uk
      t.string     :header_en
      t.string     :text_en
      t.string     :header_ru
      t.string     :text_ru
      t.string     :header_uk
      t.string     :text_uk
      t.string     :myPhoto
      t.timestamps
    end
  end
end
