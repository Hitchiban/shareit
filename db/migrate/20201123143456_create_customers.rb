class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :genre
      t.integer :birth_date
      t.integer :phone_number
      t.string :address
      t.integer :zipcode
      t.string :nickname
      t.string :role

      t.timestamps
    end
  end
end
