class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.integer :date_begin
      t.integer :date_end
      t.references :customer, null: false, foreign_key: true
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
