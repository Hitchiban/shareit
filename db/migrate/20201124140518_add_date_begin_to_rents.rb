class AddDateBeginToRents < ActiveRecord::Migration[6.0]
  def change
    add_column :rents, :date_begin, :date
  end
end
