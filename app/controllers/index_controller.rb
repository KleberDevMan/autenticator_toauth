class IndexController < ApplicationController

  require 'rest-client'
  require 'json'

  BASE_URL = "http://localhost:4000"

  def index;
  end

  def questions
    begin
      cpf = params[:cpf]

      if cpf != nil
        # Usada pra saber se já submeteu o formulário
        cookies.encrypted[:formulario_enviado] = false

        value = RestClient.get "#{BASE_URL}/pessoas/#{cpf}"

        user = JSON.parse(value, :symbolize_names => true)

        @user_request = UserRequest.create(cpf: cpf, value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true, jsonb_result: user)
        @questions = @user_request.request_questions
      end
    rescue => error
      flash[:notice] = error.message
      redirect_to index_path
    end

  end

  def result

    if params.include?(:q0) and params.include?(:q1) and params.include?(:q2)

      cookies.encrypted[:formulario_enviado] = true

      number_question = 0

      # Atribui o valor da alternativa escolhida a sua pergunta
      requisicao = UserRequest.find(params[:requisicao])

      @questions = requisicao.request_questions

      @result = true

      @questions.each do |question|
        answer = question.answers.find(params["q#{number_question}"]).value
        question.update(value: answer)
        # resultado final
        @result = (@result and question.answers.find(params["q#{number_question}"]).value)
        number_question = number_question + 1
      end

      # Gerar o Token e guia-lo ate o ToAuth
      if @result
        # //
      end


    end

  end

end
