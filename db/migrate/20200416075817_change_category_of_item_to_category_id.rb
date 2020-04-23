class ChangeCategoryOfItemToCategoryId < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :category, :integer
    add_reference :items, :category, index: true, null: false
  end
end
