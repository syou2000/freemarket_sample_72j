class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :last_name,           null: false
      t.string  :first_name,          null: false
      t.string  :last_name_hurigana,  null: false
      t.string  :first_name_hurigana, null: false
      t.integer :zip_code,            null: false, index: false
      t.string  :prefecture,          null: false
      t.string  :city,                null: false
      t.string  :house_number,        null: false
      t.string  :building,            allow_nil: true
      t.string  :phone_number,        default: "", allow_nil: true, unique: true
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
