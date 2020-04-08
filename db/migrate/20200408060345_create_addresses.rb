class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :last_name
      t.string  :first_name
      t.string  :last_name_hurigana
      t.string  :first_name_hurigana
      t.integer :zip_code,           null: false, index: false
      t.string  :city
      t.string  :building
      t.string  :prefecture
      t.string  :house_number,       allow_nil: true
      t.string  :phone_number,       default: "", allow_nil: true
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
