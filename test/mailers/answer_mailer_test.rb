require 'test_helper'

class AnswerMailerTest < ActionMailer::TestCase
  attr_reader :mail_to, :answer

  def setup
    @answer = Answer.create!(
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
    @mail_to = MailTo.create!(
      email: "test@example.com"
    )
  end

  test "send" do
    mail = AnswerMailer.answer_email answer, @mail_to.email

    assert_emails 1 do
      mail.deliver_now
    end

    assert_equal [mail_to.email], mail.to
  end
end
