class CreateMailTos < ActiveRecord::Migration[5.2]
  def change
    create_table :mail_tos do |t|
      t.string :email, null: false
      t.string :name

      t.timestamps
    end
    add_index :mail_tos, :email, unique: true
  end
end
