class IndexController < ApplicationController

  before_action :set_questions_type, only: %i[sign_up]

  # ---- VIEW ----
  def index
  end

  def sign_up
    if params[:cpf] === '69199128055'

      # Crio a requisicao do usuario e salvo no banco
      $user_request = UserRequest.create(cpf: "69199128055", value: false, json_result: "Aqui sera armazenado o .json vindo da receita")

      redirect_to questions_path
    end
  end

  def questions
    # Crio a primeira pergunta
    generate_question()
  end

  # --- UTIL ----
  def generate_question

    #Busco uma Questao aleatoria no banco
    question = Question.all.sample

    # Crio pergunta baseado na requisicao do usuario
    request_question = RequestQuestion.new(desc: question.desc, question: question, user_request: $user_request)

    # Gero 3 respostas aleatórias, baseadas na questao que veio
    answers = generate_anwser(request_question, 3)


    puts "kleber junio"
    # puts question.inspect
    # puts $request_question.inspect
    puts answers.inspect
  end

  #
  def generate_anwser(type, questions_nubers)
    # respostas
    anwers = []

    id = type.question.question_type.id

    # Se quer respostas do tipo: Nome
    if id === $name_type
      # Adiciona alterantivas falsas do tipo da pergunta
      for i in 1..questions_nubers
        anwers << Answer.find(2)
      end
    end

    return anwers
  end

  private

  def set_questions_type
    $name_type = QuestionType.find(1).id
  end

end
