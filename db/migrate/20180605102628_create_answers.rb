class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      # json order may important
      t.json :content, null: false

      t.timestamps
    end
  end
end
