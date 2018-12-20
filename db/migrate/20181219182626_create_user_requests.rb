class CreateUserRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :user_requests do |t|
      t.string :cpf
      t.boolean :value

      t.timestamps
    end
  end
end
