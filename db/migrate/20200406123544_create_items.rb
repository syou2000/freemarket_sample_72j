class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,          null: false,      index:true
      t.integer     :price,         null: false,      index:true
      t.text        :explain,       null: false
      t.string      :postage,       null: false
      t.string      :prefecture,    null: false
      t.string      :shipping_date, null: false
      t.integer     :brand,         allow_nil: true
      # t.integer     :category,      default: "",      null: false
      # t.integer :user_id,       allow_nil: true
      t.string   :item_status,      null: false
      t.timestamps
    end
  end
end