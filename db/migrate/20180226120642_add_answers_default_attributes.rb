class AddAnswersDefaultAttributes < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:answers, :correct, from: true, to: false)
  end
end
