class CreateItems < ActiveRecord::Migration[6.1]
  
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :text
      t.boolean :is_active
      t.integer :non_taxed_price
      t.timestamps
    end
  end
end
