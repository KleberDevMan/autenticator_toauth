class AddQuestionTypeToQuestionSubType < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_sub_types, :question_type, foreign_key: true
  end
end
