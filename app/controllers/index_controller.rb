class IndexController < ApplicationController
  def sign_up
    if params[:cpf] === '69199128055'

      # busca cpf na Receita Federal
      # --

      # Crio a requisicao do usuario e salvo no banco
      user_request = UserRequest.create(cpf: '69199128055', value: false, json_result: 'Dado do Json da Receita Federal', return_web_service: true)

      # Recupero a lista de questoes geradas pela criação da requisição
      $request_questions = user_request.request_questions

      puts $request_questions.inspect

      redirect_to questions_path
    end
  end

  def questions; end
end
