class IndexController < ApplicationController

  def index; end

  def sign_up
    if params[:cpf] === '69199128055'

      # busca cpf na Receita Federal
      # --

      # Crio a requisicao do usuario e salvo no banco
      $user_request = UserRequest.create(cpf: '69199128055', value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true)
      #
      # # Recupero a lista de questoes geradas pela criação da requisição
      # $request_questions = user_request.request_questions
      #
      # puts $request_questions.inspect

      redirect_to questions_path
    end
  end

  def questions
    @user_request = $user_request

    @q1 = $user_request.request_questions[0]
    @q2 = $user_request.request_questions[1]
    @q3 = $user_request.request_questions[2]


  end

  def result
    puts "questão 1: #{params[:age]}"
    puts "questão 2: #{params[:q1]}"
    puts "questão 3: #{params[:q3]}"
  end

end
