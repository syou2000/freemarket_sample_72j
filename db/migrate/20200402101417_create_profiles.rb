class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string     :user_icon
      t.string     :profile_text
      t.integer    :late_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
