class IndexController < ApplicationController

  def index;
  end


  def questions

    begin

      cpf = params[:cpf]
      if cpf != nil

        if Rails.env.production?
          value = UserRequest.search_cpf(params[:cpf]).body[:ws_info_conv_proxy_execute_response][:consultarcpfpessoaperfild][:pessoa_perfil_d]
        else
          value = {:cpf => "06250631127", :nome => "KLEBER JUNIO CABRAL CHAVES", :situacao_cadastral => "0", :residente_exterior => "2", :codigo_pais_exterior => "0000", :nome_pais_exterior => nil, :nome_mae => "MARIA EUNICE PESSOA CABRAL", :data_nascimento => "19980406", :sexo => "1", :natureza_ocupacao => "000", :ocupacao_principal => "000", :exercicio_ocupacao => "0000", :tipo_logradouro => "OUTROS", :logradouro => "GUARUJA QDR 121", :numero_logradouro => "3", :complemento => nil, :cep => "77270000", :bairro => "MORADA DO SOL", :codigo_municipio => "9733", :municipio => "PALMAS", :uf => "TO", :ddd => "0000", :telefone => "00000000", :unidade_administrativa => "0150100", :ano_obito => "0000", :estrangeiro => "0", :data_atualizacao => "20160612", :titulo_eleitor => nil, :erro => nil, :@xmlns => "https://infoconv.receita.fazenda.gov.br/ws/cpf/"}
        end

        # Usada pra saber se já submeteu o formulário
        cookies.encrypted[:formulario_enviado] = false

        @user_request = UserRequest.create(cpf: cpf, value: false, json_result: value, return_web_service: true, jsonb_result: value)
        @questions = @user_request.request_questions

        puts "--> #{@user_request.inspect}"
        puts "--> #{@questions.inspect}"
      end

    rescue => error
      @value = error
      redirect_to index_path(value: @value)
    end

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
