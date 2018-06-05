require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  def build_content
    [
      {
        q: "What's your name?",
        a: "cy"
      },
      {
        q: "What's your job?",
        a: "developer"
      }
    ]
  end

  def build_answer(content: build_content)
    Answer.new(
      content: content
    )
  end

  def create_answer
    answer = build_answer
    answer.save!
    answer
  end

  test "content is q/a array" do
    answer = create_answer
    assert answer.content, build_content
  end

  class ValidatesTest < AnswerTest
    test "should be valid" do
      assert build_answer.valid?
    end

    test "content must be present" do
      assert_not build_answer(content: nil).valid?
    end
  end

end
