class Question < ApplicationRecord
  # has_many = "tem muitos"
  # lê-se: "Question possui muitas request_questions"
  has_many :request_questions
  belongs_to :question_type
end
