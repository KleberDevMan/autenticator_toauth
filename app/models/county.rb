# == Schema Information
#
# Table name: counties
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class County < ApplicationRecord
end
