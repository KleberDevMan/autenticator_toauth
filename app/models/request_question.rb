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
# Indexes
#
#  index_request_questions_on_question_id      (question_id)
#  index_request_questions_on_user_request_id  (user_request_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_request_id => user_requests.id)
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

  after_create :generate_answers

  def generate_answers

    # Se quer respostas do tipo: Nome
    if self.question.question_type.desc.downcase == "name"
      # Busca lista de Nomes
      names = Name.all
      # Popula lista de respostas falsas
      for i in 1..3
        Answer.create(desc: names.sample.desc, value: false, selected: false, request_question: self)
      end
      # Coloca uma resposta verdadeira
      Answer.create(desc: self.user_request.json_result, value: true, selected: false, request_question: self)
    end

    # Se quer respostas do tipo: Bairro
    if self.question.question_type.desc.downcase == "district"
      # Busca lista de Bairros
      districts = District.all
      # Popula lista de respostas falsas
      for i in 1..3
        Answer.create(desc: districts.sample.desc, value: false, selected: false, request_question: self)
      end
      # Coloca uma resposta verdadeira
      Answer.create(desc: self.user_request.json_result, value: true, selected: false, request_question: self)
    end

  end
end
