class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image
      t.string :rule
      t.string :rule_parameter

      t.timestamps
    end
  end
end
