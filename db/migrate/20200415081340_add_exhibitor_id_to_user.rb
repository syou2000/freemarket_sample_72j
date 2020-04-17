class AddExhibitorIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :exhibitor, foreign_key: true, allow_nil: true
  end
end
