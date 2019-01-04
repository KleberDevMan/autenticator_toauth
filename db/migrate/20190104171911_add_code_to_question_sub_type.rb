class AddCodeToQuestionSubType < ActiveRecord::Migration[5.2]
  def change
    add_column :question_sub_types, :code, :string
  end
end
