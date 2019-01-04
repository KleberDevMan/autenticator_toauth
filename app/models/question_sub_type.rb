# == Schema Information
#
# Table name: question_sub_types
#
#  id               :bigint(8)        not null, primary key
#  code             :string
#  desc             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  question_type_id :bigint(8)
#
# Indexes
#
#  index_question_sub_types_on_question_type_id  (question_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_type_id => question_types.id)
#

class QuestionSubType < ApplicationRecord
  # belongs_to = "pertence a"
  # lê-se: "o campo :question_type pentence a outra tabela"
  # É obrigatorio preecher esse campo
  belongs_to :question_type
  has_many :questions
end
