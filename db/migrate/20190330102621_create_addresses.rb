class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zip
      t.string :address

      t.timestamps
    end
  end
end
