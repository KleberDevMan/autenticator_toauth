class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.string :desc
      t.boolean :sexo

      t.timestamps
    end
  end
end
