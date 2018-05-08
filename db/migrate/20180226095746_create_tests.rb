class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end

    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
