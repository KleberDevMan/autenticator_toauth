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

class UserRequest < ApplicationRecord
  # has_many = "tem muitos"
  # lê-se: "UserRequest possui muitas request_questions"
  has_many :request_questions

  after_create :generate_request_questions

  def generate_request_questions
    if self.return_web_service
      # criar as perguntas da requisição
      # Busco uma perguntas aleatorias no banco
      questions = Question.all
      for i in 1..3
        question = questions.sample
        # Crio pergunta baseado na requisicao do usuario
        RequestQuestion.create(desc: question.desc, question: question, user_request: self)
      end
    end
  end
end
