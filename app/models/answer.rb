class Answer < ApplicationRecord
  validates :content, presence: true

  # content should be like this
  # no need to validate content format in model, if error, also send email
  # [
  #   {
  #     "q": "question1",
  #     "a": "answer1"
  #   },
  #   {
  #     "q": "question2",
  #     "a": "answer"
  #   }
  # ]
end
