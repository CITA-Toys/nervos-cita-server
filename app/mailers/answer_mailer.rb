class AnswerMailer < ApplicationMailer
  def answer_email(answer, email)
    @answer = answer
    mail to: email, subject: "nervos-cita contact"
  end
end
