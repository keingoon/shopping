class AddAddressIdToPays < ActiveRecord::Migration[5.2]
  def change
    add_column :pays, :address_id, :string, foreign_key: true
  end
end
