class AddRequestQuestionToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :request_question, foreign_key: true
  end
end
