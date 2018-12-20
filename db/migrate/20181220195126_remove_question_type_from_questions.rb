class RemoveQuestionTypeFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :question_type, :string
  end
end
