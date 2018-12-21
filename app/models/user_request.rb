# == Schema Information
#
# Table name: user_requests
#
#  id          :bigint(8)        not null, primary key
#  cpf         :string
#  value       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  json_result :string
#

class UserRequest < ApplicationRecord
  # has_many = "tem muitos"
  # lê-se: "UserRequest possui muitas request_questions"
  has_many :request_questions

  after_create :generate_request_questions

  def generate_request_questions
    if return_receita
      # criar as perguntas da requisição
    end
  end
end
