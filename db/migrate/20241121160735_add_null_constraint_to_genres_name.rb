class AddNullConstraintToGenresName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :genres, :name, false
  end
end
