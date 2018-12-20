class CreateRequestQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :request_questions do |t|
      t.string :desc

      t.timestamps
    end
  end
end
