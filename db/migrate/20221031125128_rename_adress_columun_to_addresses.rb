class RenameAdressColumunToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :adress, :address
  end
end
