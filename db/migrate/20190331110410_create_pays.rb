class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.string :charge_id
      t.integer :amount

      t.timestamps
    end
  end
end
