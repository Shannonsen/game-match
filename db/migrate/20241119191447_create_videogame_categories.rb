class CreateVideogameCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :videogame_categories do |t|
      t.references :videogame, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
