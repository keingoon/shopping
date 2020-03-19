class CreateAdministrators < ActiveRecord::Migration[5.2]
  def change
    create_table :administrators do |t|
      t.string :email, null:false
      t.string :password_digest
      t.string :name, null:false
      t.string :name_kana
      t.timestamps
    end
  end
end
