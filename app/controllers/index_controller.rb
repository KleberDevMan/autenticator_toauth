class IndexController < ApplicationController

  before_action :init, only: %i[sign_up]

  # ---- VIEW ----
  def index
  end

  def sign_up
    if params[:cpf] === '69199128055'

      # busca cpf na Receita Federal

      # Crio a requisicao do usuario e salvo no banco
      $user_request = UserRequest.create(cpf: "69199128055", value: false, json_result: "Aqui sera armazenado o .json vindo da receita")

      redirect_to questions_path
    end
  end

  def questions
    puts $request_questions.inspect

    # Crias as perguntas
    if $request_questions.empty?
      $request_questions = generate_questions(3)
      puts $request_questions.inspect
      puts $request_questions[0].answers.count
      puts $request_questions[1].answers.empty?
      puts $request_questions[2].answers.inspect
    end
  end

  # --- UTIL ----
  def generate_questions(questions_numbers)
    # # Busco uma Questao aleatoria no banco
    # question = Question.all.sample
    # # Crio pergunta baseado na requisicao do usuario
    # $request_question = RequestQuestion.new(desc: question.desc, question: question, user_request: $user_request)
    # # Gero 3 respostas aleatórias, baseadas na questao aleatoria buscada
    # $answers = generate_anwsers($request_question, 3)

    request_questions = []

    for i in 1..questions_numbers
      # Busco uma pergunta aleatoria no banco
      question = Question.all.sample
      # Crio pergunta baseado na requisicao do usuario
      request_question = RequestQuestion.new(desc: question.desc, question: question, user_request: $user_request)
      # adiciono na lista
      request_questions << request_question

      # Crio as respostas para a pergunta
      generate_anwsers(request_question, 3)
    end

    request_questions
  end

  def result
    result = false
  end


  private
  def init
    # Variaveis globais
    $request_question = nil
    $answers = []
    $request_questions = []

    # Tipos de questoes
    $name_type = QuestionType.find(1)
    $district_type = QuestionType.find(2)
  end
  def generate_anwsers(request_question, questions_nubers)

    anwers = []

    question_type_id = request_question.question.question_type.id

    # Se quer respostas do tipo: Nome
    if question_type_id === $name_type.id
      # Popula lista de respostas falsas
      for i in 1..questions_nubers
        anwer = Answer.create(desc: Name.all.sample.desc, value: false, selected: false, request_question: request_question)
        anwers << anwer
      end

      # Retorna lista de respostas falsas
      return anwers
    end

    # Se quer respostas do tipo: Bairro
    if question_type_id === $district_type.id
      for i in 1..questions_nubers
        anwer = Answer.create(desc: District.all.sample.desc, value: false, selected: false, request_question: request_question)
        anwers << anwer
      end

      # Retorna list de respostas falsas
      return anwers
    end
  end

end
