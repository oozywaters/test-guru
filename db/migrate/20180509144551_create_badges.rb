class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.text :title
      t.text :img
      t.string :rule

      t.timestamps
    end
  end
end
