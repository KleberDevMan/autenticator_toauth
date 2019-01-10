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
        $issues_submitted = false

        value = RestClient.get "#{BASE_URL}/pessoas/#{cpf}"

        user = JSON.parse(value, :symbolize_names => true)

        user_request = UserRequest.create(cpf: cpf, value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true, jsonb_result: user)

        $q1 = user_request.request_questions[0]
        $q2 = user_request.request_questions[1]
        $q3 = user_request.request_questions[2]
      end
    rescue
      redirect_to index_path
    end

  end

  def result
    $issues_submitted = nil

    if params[:q1] != nil || params[:q1] != nil || params[:q1] != nil
      $q1.value = params[:q1]
      $q2.value = params[:q2]
      $q3.value = params[:q3]
    end
  end

  def teste
    value = RestClient.get "#{BASE_URL}/users"
    @users = JSON.parse(value, :symbolize_names => true)
  end

  private

end
