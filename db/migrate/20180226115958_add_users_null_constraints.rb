class AddUsersNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:users, :username, false)
    change_column_null(:users, :password, false)
    change_column_null(:users, :firstname, false)
    change_column_null(:users, :lastname, false)
    change_column_null(:users, :email, false)
  end
end
