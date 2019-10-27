class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters do |t|
      t.string :title, null: false
      t.date :release_date, null: false, unique: true
      t.string :lyra_id

      t.boolean :published, null: false, default: false, index: true

      t.timestamps
    end
  end
end
