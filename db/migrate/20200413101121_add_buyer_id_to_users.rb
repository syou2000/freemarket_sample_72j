class AddBuyerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :buyer, foreign_key: true, allow_nil: true
  end
end
