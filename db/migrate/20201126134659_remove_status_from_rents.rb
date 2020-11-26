class RemoveStatusFromRents < ActiveRecord::Migration[6.0]
  def change
    remove_column :rents, :status, :boolean, default: false
  end
end
