class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :desc
      t.boolean :question_type

      t.timestamps
    end
  end
end
