class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.references :company, foreign_key: true

      t.timestamps
    end
    add_index :products, [:company_id, :created_at]
  end
end
