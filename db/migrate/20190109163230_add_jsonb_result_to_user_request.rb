class AddJsonbResultToUserRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :jsonb_result, :jsonb, null: true, default: '{}'
  end
end
