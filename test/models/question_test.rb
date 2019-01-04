# == Schema Information
#
# Table name: questions
#
#  id                   :bigint(8)        not null, primary key
#  desc                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_sub_type_id :bigint(8)
#  question_type_id     :bigint(8)
#
# Indexes
#
#  index_questions_on_question_sub_type_id  (question_sub_type_id)
#  index_questions_on_question_type_id      (question_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_sub_type_id => question_sub_types.id)
#  fk_rails_...  (question_type_id => question_types.id)
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
