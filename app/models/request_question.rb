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

    # tipos de pergunta
    name_type = QuestionType.where(desc: 'Name').take!
    district_type = QuestionType.where(desc: 'District').take!
    county_type = QuestionType.where(desc: 'County').take!
    date_of_birth_type = QuestionType.where(desc: 'DateOfBirth').take!

    # Se a question for do tipo: Nome
    if self.question.question_type == name_type

      # Busca lista de Nomes
      # names = Name.all
      name_true = self.user_request.jsonb_result['Nome']

      # Verificando os sub tipos de perguntas
      case self.question.question_sub_type.code
        # primeiro nome
      when '1'
        for i in 1..3
          # name = names.sample
          # names = names.reject {|a| a == name}
          Answer.create(desc: Faker::Name.first_name, value: false, selected: false, request_question: self)
        end

        # Criar uma resposta verdadeira
        Answer.create(desc: name_true.truncate_words(1, omission: '').capitalize, value: true, selected: false, request_question: self)

        # sobrenome
      when '3'
        for i in 1..3
          # name = names.sample
          # names = names.reject {|a| a == name}
          Answer.create(desc: Faker::Name.last_name, value: false, selected: false, request_question: self)
        end

        # Criar uma resposta verdadeira
        index_last_space = name_true.rindex(' ') + 1
        size_name = name_true.size

        Answer.create(desc: name_true[index_last_space, size_name].capitalize, value: true, selected: false, request_question: self)
      end


    end

    # Se a question for do tipo: Bairro
    if self.question.question_type == district_type
      # Busca dados no banco
      districts = District.all
      district_true = self.user_request.jsonb_result['Bairro']

      # Verificando os sub tipos de perguntas
      case self.question.question_sub_type.code
      when '1'
        for i in 1..3
          district = districts.sample
          districts = districts.reject {|a| a == district}
          Answer.create(desc: district.desc, value: false, selected: false, request_question: self)
        end
      end

      # Cria uma resposta verdadeira
      Answer.create(desc: district_true.capitalize, value: true, selected: false, request_question: self)
    end


    # Se quer respostas do tipo: Muninicipio
    if self.question.question_type == county_type
      # Busca dados no banco
      counties = County.all
      county_true = self.user_request.jsonb_result['Municipio']

      # Verificando os sub tipos de perguntas
      case self.question.question_sub_type.code
      when '1'
        for i in 1..3
          county = counties.sample
          counties = counties.reject {|a| a == county}
          Answer.create(desc: county.desc, value: false, selected: false, request_question: self)
        end
      end

      # Cria uma resposta verdadeira
      Answer.create(desc: county_true.capitalize, value: true, selected: false, request_question: self)
    end

    # Se quer respostas do tipo: Data de Nascimento
    if self.question.question_type == date_of_birth_type
      # Busca dados no banco
      date_of_births = DateOfBirth.all
      date_of_birth_true = self.user_request.jsonb_result['DataNascimento']
      date_of_birth_true = date_of_birth_true.to_s

      # Verificando os sub tipos de perguntas
      case self.question.question_sub_type.code
      when '1'
        for i in 1..3
          date_of_birth = date_of_births.sample
          date_of_births = date_of_births.reject {|a| a == date_of_birth}
          Answer.create(desc: date_of_birth.day, value: false, selected: false, request_question: self)
        end

        # Coloca uma resposta verdadeira
        Answer.create(desc: date_of_birth_true[6..7], value: true, selected: false, request_question: self)

      when '2'
        for i in 1..3
          date_of_birth = date_of_births.sample
          date_of_births = date_of_births.reject {|a| a == date_of_birth}
          Answer.create(desc: date_of_birth.month, value: false, selected: false, request_question: self)
        end

        # Coloca uma resposta verdadeira
        Answer.create(desc: date_of_birth_true[4..5], value: true, selected: false, request_question: self)

      when '3'
        for i in 1..3
          date_of_birth = date_of_births.sample
          date_of_births = date_of_births.reject {|a| a == date_of_birth}
          Answer.create(desc: date_of_birth.year, value: false, selected: false, request_question: self)
        end

        # Coloca uma resposta verdadeira
        Answer.create(desc: date_of_birth_true[0..3], value: true, selected: false, request_question: self)

      end


    end

  end
end
