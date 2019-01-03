# == Schema Information
#
# Table name: answers
#
#  id                  :bigint(8)        not null, primary key
#  desc                :string
#  selected            :boolean
#  value               :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  request_question_id :bigint(8)
#
# Indexes
#
#  index_answers_on_request_question_id  (request_question_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_question_id => request_questions.id)
#

class Answer < ApplicationRecord
  # belongs_to = "pertence a"
  # lê-se: "o campo :request_question pentence a outra tabela"
  # É obrigatorio preecher esse campo
  belongs_to :request_question
end
