# == Schema Information
#
# Table name: question_types
#
#  id         :bigint(8)        not null, primary key
#  desc       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuestionType < ApplicationRecord
  has_many :questions
end
