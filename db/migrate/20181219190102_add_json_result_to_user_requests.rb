class AddJsonResultToUserRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :json_result, :string
  end
end
