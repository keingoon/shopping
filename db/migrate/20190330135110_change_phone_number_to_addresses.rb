class ChangePhoneNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :phone_number, :text
  end
end
