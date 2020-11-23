class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :genre, :string
    add_column :users, :birth_date, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :address, :string
    add_column :users, :nickname, :string
  end
end
