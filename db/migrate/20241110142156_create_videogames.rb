class CreateVideogames < ActiveRecord::Migration[6.1]
  def change
    create_table :videogames do |t|
      t.string :name
      t.string :publisher
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.date :release_date

      t.timestamps
    end
  end
end
