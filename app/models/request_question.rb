# == Schema Information
#
# Table name: request_questions
#
#  id              :bigint(8)        not null, primary key
#  desc            :string
#  value           :boolean
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
        name = names.sample
        names = names.reject{ |a| a == name }
        Answer.create(desc: name.name, value: false, selected: false, request_question: self)
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
        district = districts.sample
        districts = districts.reject{ |a| a == district }
        Answer.create(desc: district.desc, value: false, selected: false, request_question: self)
      end
      # Coloca uma resposta verdadeira
      Answer.create(desc: self.user_request.json_result, value: true, selected: false, request_question: self)
    end


    # Se quer respostas do tipo: Muninicipio
    if self.question.question_type.desc.downcase == "county"
      counties = County.all
      # Popula lista de respostas falsas
      for i in 1..3
        county = counties.sample
        counties = counties.reject{ |a| a == county }
        Answer.create(desc: county.desc, value: false, selected: false, request_question: self)
      end
      # Coloca uma resposta verdadeira
      Answer.create(desc: self.user_request.json_result, value: true, selected: false, request_question: self)
    end

    # Se quer respostas do tipo: Data de Nascimento
    if self.question.question_type.desc.downcase == "date"
      date_of_births = DateOfBirth.all
      # Popula lista de respostas falsas
      for i in 1..3
        date_of_birth = date_of_births.sample
        date_of_births = date_of_births.reject{ |a| a == date_of_birth }
        Answer.create(desc: date_of_birth.month, value: false, selected: false, request_question: self)
      end
      # Coloca uma resposta verdadeira
      Answer.create(desc: self.user_request.json_result, value: true, selected: false, request_question: self)
    end

  end
end
