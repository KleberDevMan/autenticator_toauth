class UserRequest < ApplicationRecord
  # has_many = "tem muitos"
  # lê-se: "UserRequest possui muitas request_questions"
  has_many :request_questions
end
