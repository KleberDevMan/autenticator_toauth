class AddReturnWebServiceToUserRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :return_web_service, :boolean
  end
end
