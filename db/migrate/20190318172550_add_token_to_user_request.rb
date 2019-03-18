class AddTokenToUserRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :token, :string
  end
end
