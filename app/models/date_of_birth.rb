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

class DateOfBirth < ApplicationRecord
end
