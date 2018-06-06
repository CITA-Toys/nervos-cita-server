# Preview all emails at http://localhost:3000/rails/mailers/answer_mailer
class AnswerMailerPreview < ActionMailer::Preview
  def create_answer
    Answer.create!(
      content: [
        {
          q: "What's your name?",
          a: "cy"
        },
        {
          q: "What's your job?",
          a: "developer"
        }
      ]
    )
  end

  def answer_email
    AnswerMailer.answer_email(create_answer, "test@example.com")
  end
end
