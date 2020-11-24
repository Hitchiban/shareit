class AddDateEndToRents < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :date_end, :date
  end
end
