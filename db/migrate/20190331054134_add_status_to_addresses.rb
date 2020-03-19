class AddStatusToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :status, :integer
  end
end
