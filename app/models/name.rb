# == Schema Information
#
# Table name: names
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  sexo       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Name < ApplicationRecord
end
