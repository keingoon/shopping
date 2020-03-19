class AddCardTokenIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :card_token_id, :string
  end
end
