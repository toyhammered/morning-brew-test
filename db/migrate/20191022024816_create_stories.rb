class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.references :newsletter, null: false, index: true, foreign_key: true

      t.string :title, null: false
      t.string :tag, null: false
      t.string :lyra_id
      
      t.text :body, null: false

      t.timestamps
    end
  end
end
