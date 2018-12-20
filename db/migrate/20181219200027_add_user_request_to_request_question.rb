class AddUserRequestToRequestQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :request_questions, :user_request, foreign_key: true
  end
end
