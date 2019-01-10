# == Schema Information
#
# Table name: user_requests
#
#  id                 :bigint(8)        not null, primary key
#  cpf                :string
#  json_result        :string
#  jsonb_result       :jsonb
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

    # criar as perguntas da requisição
    if self.return_web_service
      # Busco todas perguntas
      questions = Question.all
      for i in 1..3
        question = questions.sample
        questions = questions.reject {|a| a == question} # rejeito as questoes que ja usei
        # Crio pergunta baseado na requisicao do usuario
        RequestQuestion.create(desc: question.desc, question: question, user_request: self, value: false)
      end
    end
  end
end
