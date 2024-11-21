class AddNullConstraintToCategoriesName < ActiveRecord::Migration[6.1]
  def change
    change_column_null :categories, :name, false
  end
end
