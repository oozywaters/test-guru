class AddTypeAttributeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type
    remove_column :users, :role, :string
  end
end
