class RemoveCardTokenIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :card_token_id, :string
  end
end
