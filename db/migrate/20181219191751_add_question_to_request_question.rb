class AddQuestionToRequestQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :request_questions, :question, foreign_key: true
  end
end
