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
        value = RestClient.get "#{BASE_URL}/pessoas/#{cpf}"

        user = JSON.parse(value, :symbolize_names => true)

        user_request = UserRequest.create(cpf: cpf, value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true)

        @q1 = user_request.request_questions[0]
        @q2 = user_request.request_questions[1]
        @q3 = user_request.request_questions[2]
      end
    rescue
      redirect_to index_path
    end

  end

  def result
    @answer1 = params[:q1]
    @answer2 = params[:q2]
    @answer3 = params[:q3]
  end

  def teste
    value = RestClient.get "#{BASE_URL}/users"
    @users = JSON.parse(value, :symbolize_names => true)
  end
end
