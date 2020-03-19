class AddManagerAdministrators < ActiveRecord::Migration[5.2]
  def change
    add_column :administrators, :manager, :boolean, default: false 
  end
end
