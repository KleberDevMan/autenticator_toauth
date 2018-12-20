class Answer < ApplicationRecord
  # belongs_to = "pertence a"
  # lê-se: "o campo :request_question pentence a outra tabela"
  # É obrigatorio preecher esse campo
  belongs_to :request_question
end
