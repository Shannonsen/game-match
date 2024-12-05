class CreateVideogames < ActiveRecord::Migration[6.1]
  def change
    create_table :videogames do |t|
      t.string :name, null: false
      t.string :publisher
      t.string :description, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.date :release_date

      t.timestamps
    end
  end
end
