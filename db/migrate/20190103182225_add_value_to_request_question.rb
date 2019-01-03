class AddValueToRequestQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :request_questions, :value, :boolean
  end
end
