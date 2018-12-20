class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :desc
      t.boolean :value
      t.boolean :selected

      t.timestamps
    end
  end
end
