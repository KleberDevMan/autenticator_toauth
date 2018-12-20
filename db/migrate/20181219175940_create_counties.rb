class CreateCounties < ActiveRecord::Migration[5.2]
  def change
    create_table :counties do |t|
      t.string :desc

      t.timestamps
    end
  end
end
