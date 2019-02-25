class IndexController < ApplicationController

  require 'rest-client'
  require 'json'

  BASE_URL = "http://localhost:3000"

  def index;
  end

  def questions
    begin
      cpf = params[:cpf]

      if cpf != nil
        # Usada pra saber se já submeteu o formulário
        # $issues_submitted = false
        cookies.encrypted[:issues_submitted] = false

        value = RestClient.get "#{BASE_URL}/pessoas/#{cpf}"

        user = JSON.parse(value, :symbolize_names => true)

        user_request = UserRequest.create(cpf: cpf, value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true, jsonb_result: user)

        # $questions = Array.new
        # $questions = user_request.request_questions



        cookies[:questions] = JSON.generate(user_request.request_questions.to_json)
        # cookies[:questions] = JSON.generate(user_request.request_questions)
      end
    rescue => error
      flash[:notice] = error.message
      redirect_to index_path
    end

  end

  def result

    if params[:q0] != nil

      cookies.delete :issues_submitted

      number_question = 0

      puts $questions.count
      puts $questions.inspect

      $questions.each do |question|
        result = question.answers.find(params["q#{number_question}"]).value
        question.update(value: result)
        number_question = number_question + 1
      end

      puts $questions.inspect

    end
  end

end
