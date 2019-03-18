class AddRegistrationStatusToUserRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :registration_status, :string
  end
end
