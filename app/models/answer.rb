class Answer < ApplicationRecord
  validates :content, presence: true

  after_create_commit :send_email

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

  private

  def send_email
    MailTo.find_each do |mt|
      AnswerMailer.answer_email(self, mt.email).deliver_later
    end
  end
end
