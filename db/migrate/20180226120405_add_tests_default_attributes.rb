class AddTestsDefaultAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
  end
end
