class AddBudgetToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :budget, :decimal
  end
end
