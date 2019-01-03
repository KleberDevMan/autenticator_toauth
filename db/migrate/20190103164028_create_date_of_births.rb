class CreateDateOfBirths < ActiveRecord::Migration[5.2]
  def change
    create_table :date_of_births do |t|
      t.string :day
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end
