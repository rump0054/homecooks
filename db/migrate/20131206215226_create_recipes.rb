class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :prep_time
      t.string :cook_time
      t.string :yields
      t.text :ingredients
      t.text :directions
      t.text :description
      t.text :notes
      t.boolean :share
      t.integer :user_id

      t.timestamps
    end
  end
end
