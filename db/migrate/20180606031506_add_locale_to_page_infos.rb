class AddLocaleToPageInfos < ActiveRecord::Migration[5.2]
  def change
    # add locale
    add_column :page_infos, :locale, :string
    # remove name unique
    remove_index :page_infos, :name
    # add unique index in name and locale
    add_index :page_infos, [:name, :locale], unique: true
  end
end
