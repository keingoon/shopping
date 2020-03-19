class AddPrefectureIdPhoneNumberToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefecture_id, :integer
    add_column :addresses, :phone_number, :integer
  end
end
