class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :picture
      t.string :title
      t.string :description
      t.string :price
      t.references :vendor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
