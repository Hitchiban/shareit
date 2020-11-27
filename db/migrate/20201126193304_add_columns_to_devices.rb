class AddColumnsToDevices < ActiveRecord::Migration[6.0]
  def change
    add_column :devices, :brand, :string
    add_column :devices, :game, :string
    add_column :devices, :controller, :integer
  end
end
