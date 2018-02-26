class AddAnswersNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)
  end
end
