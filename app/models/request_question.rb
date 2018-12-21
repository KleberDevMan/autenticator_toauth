# == Schema Information
#
# Table name: request_questions
#
#  id              :bigint(8)        not null, primary key
#  desc            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  question_id     :bigint(8)
#  user_request_id :bigint(8)
#

class RequestQuestion < ApplicationRecord
  # belongs_to = "pertence a"
  # lê-se: "o campo :question pentence a outra tabela"
  # É obrigatorio preecher esse campo
  belongs_to :question
  belongs_to :user_request

  # has_many = "tem muitos"
  # lê-se: "RequestQuestion possui muitas answers"
  has_many :answers
end
