class RemoveDateBeginFromRents < ActiveRecord::Migration[6.0]
  def change
    remove_column :rents, :date_begin, :integer
  end
end
