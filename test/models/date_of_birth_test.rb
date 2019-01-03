# == Schema Information
#
# Table name: date_of_births
#
#  id         :bigint(8)        not null, primary key
#  day        :string
#  month      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DateOfBirthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
