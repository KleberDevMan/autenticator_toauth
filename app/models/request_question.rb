class RequestQuestion < ApplicationRecord
  # belongs_to = "pertence a"
  # lê-se: "o campo :question pentence a outra tabela"
  # É obrigatorio preecher esse campo
  belongs_to :question
  belongs_to :user_request

  # has_many = "tem muitos"
  # lê-se: "RequestQuestion possui muitas answers"
  has_many :answers
end
