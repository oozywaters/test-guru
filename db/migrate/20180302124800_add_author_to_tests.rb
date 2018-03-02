class AddAuthorToTests < ActiveRecord::Migration[5.1]
  def change
    add_reference(
      :tests,
      :author,
      foreign_key: { to_table: :users },
      null: false,
      default: false
    )
  end
end
