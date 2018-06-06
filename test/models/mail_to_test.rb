require 'test_helper'

class MailToTest < ActiveSupport::TestCase
  def build_mail_to(email: "test@example.com", name: "name")
    MailTo.new(
      email: email,
      name: name
    )
  end

  class ValidatesTest < MailToTest
    test "should be valid" do
      assert build_mail_to.valid?
    end

    test "email should be presence" do
      assert_not build_mail_to(email: nil).valid?
    end

    test "email should be unique" do
      build_mail_to.save!
      assert_not build_mail_to(email: "test@example.com").valid?
    end

    test"email should be short than 256 characters" do
      email = "#{'a' * 244}@example.com"
      assert email.size, 256
      assert_not build_mail_to(email: email).valid?
    end

    test "email can be 255 characters" do
      email = "#{'a' * 243}@example.com"
      assert email.size, 255
      assert build_mail_to(email: email).valid?
    end

    test "email format should be valid" do
      email = "example.com"
      assert_not build_mail_to(email: email).valid?
    end
  end
end
