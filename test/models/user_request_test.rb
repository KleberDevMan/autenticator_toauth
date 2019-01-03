# == Schema Information
#
# Table name: user_requests
#
#  id                 :bigint(8)        not null, primary key
#  cpf                :string
#  json_result        :string
#  return_web_service :boolean
#  value              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class UserRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
