class ChangeUsersTable < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :password, :password_digest
      t.index :email, unique: true
    end
    change_column_null :users, :username, true
    change_column_null :users, :firstname, true
    change_column_null :users, :lastname, true
  end
end
