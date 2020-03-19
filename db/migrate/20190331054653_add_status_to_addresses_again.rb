class AddStatusToAddressesAgain < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :status, :boolean
  end
end
