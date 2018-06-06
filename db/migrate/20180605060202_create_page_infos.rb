class CreatePageInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :page_infos do |t|
      t.string :name, null: false
      t.jsonb :content, null: false, default: {}

      t.timestamps
    end
    add_index :page_infos, :name, unique: true
  end
end
