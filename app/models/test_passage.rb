class TestPassage < ActiveRecord::Base
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true
end