class RemoveDateEndFromRents < ActiveRecord::Migration[6.0]
  def change
    remove_column :rents, :date_end, :integer
  end
end
