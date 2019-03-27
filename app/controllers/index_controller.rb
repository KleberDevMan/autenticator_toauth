class IndexController < ApplicationController

  require 'rest-client'
  require 'json'

  BASE_URL = "http://localhost:4000"

  def index;
  end


  def questions
    # begin
    #   cpf = params[:cpf]
    #
    #   if cpf != nil
    #     # Usada pra saber se já submeteu o formulário
    #     cookies.encrypted[:formulario_enviado] = false
    #
    #     value = RestClient.get "#{BASE_URL}/pessoas/#{cpf}"
    #
    #     user = JSON.parse(value, :symbolize_names => true)
    #
    #     @user_request = UserRequest.create(cpf: cpf, value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true, jsonb_result: user)
    #     @questions = @user_request.request_questions
    #   end
    # rescue => error
    #   flash[:notice] = error.message
    #   redirect_to index_path
    # end








    begin
      if !Rails.env.development?
        @value = UserRequest.search_cpf(params[:cpf]).body[:ws_info_conv_proxy_execute_response][:consultarcpfpessoaperfild][:pessoa_perfil_d]
      else
        value = File.read(File.expand_path("../dado-receita.json", __FILE__))

        # value = RestClient.get "#{BASE_URL}/pessoas/#{params[:cpf]}"

        value_symbol = JSON.parse(value, :symbolize_names => true)

        @value = value_symbol

      end
    rescue => error
      @value = error
    end

    redirect_to index_path(value: @value)

  end


  def result

    if params.include?(:q0) and params.include?(:q1) and params.include?(:q2)

      cookies.encrypted[:formulario_enviado] = true

      number_question = 0

      # Atribui o valor da alternativa escolhida a sua pergunta
      @user_request = UserRequest.find(params[:requisicao])

      @questions = @user_request.request_questions

      @result = true

      @questions.each do |question|
        answer = question.answers.find(params["q#{number_question}"]).value
        question.update(value: answer)
        # resultado final
        @result = (@result and question.answers.find(params["q#{number_question}"]).value)
        number_question = number_question + 1
      end

    end

    def submit_token
      redirect_to "http://10.9.1.240/users/registrar?token=#{params[:token]}"
    end

    def verify_token
      render :json => UserRequest.where(token: params[:token], registration_status: :created).first
    end

    def update_token
      user_request = UserRequest.where(token: params[:token], registration_status: :created).first
      if user_request != nil
        user_request.update(registration_status: :registrated)
      end
      render :json => user_request
    end

  end

end
