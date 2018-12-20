class AddQuestionTypeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :question_type, foreign_key: true
  end
end
