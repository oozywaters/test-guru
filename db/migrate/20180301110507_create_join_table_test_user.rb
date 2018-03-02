class CreateJoinTableTestUser < ActiveRecord::Migration[5.1]
  def change
    create_join_table :tests, :users do |t|
      t.index [:test_id, :user_id]
      t.references :user, index: true, null: false, foreign_key: true
      t.references :test, index: true, null: false, foreign_key: true
    end
  end
end
