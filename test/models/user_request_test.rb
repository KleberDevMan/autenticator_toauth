# == Schema Information
#
# Table name: user_requests
#
#  id                  :bigint(8)        not null, primary key
#  cpf                 :string
#  json_result         :string
#  jsonb_result        :jsonb
#  registration_status :string
#  return_web_service  :boolean
#  token               :string
#  value               :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class UserRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
