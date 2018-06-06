require 'test_helper'

class PageInfoTest < ActiveSupport::TestCase
  def page_info_content
    "{
  \"title\": {
    \"imageURL\": \"www.example.com\",
    \"content\": \"Nervos CITA is a ...\"
  },
  \"CITA\": {
    \"content\": \"CITA is a balabala\"
  }
}"
  end

  def build_page_info(name: "homepage", content: Oj.load(page_info_content), locale: "zh-CN")
    PageInfo.new(
      name: name,
      locale: locale,
      content: content
    )
  end

  def create_page_info
    page_info = build_page_info
    page_info.save!
    page_info
  end

  test "save a json" do
    page_info = create_page_info
    assert Oj.dump(page_info.content), page_info_content
  end

  test "load a page info by name" do
    pi = create_page_info
    page_info = PageInfo.find_by name: "homepage"
    assert page_info, pi
  end

  class ValidateTest < PageInfoTest
    test "default object should be valid" do
      assert build_page_info.valid?
    end


    test "name should be presence" do
      assert_not build_page_info(name: nil).valid?
    end

    test "name and locale should be unique" do
      name = "homepage"
      locale = "en"
      build_page_info(name: name, locale: locale).save!
      assert_not build_page_info(name: name, locale: locale).valid?
    end

    test "name not to be unique" do
      name = "homepage"
      build_page_info(name: name, locale: "zh-CN").save!
      assert build_page_info(name: name, locale: "en").valid?
    end

    test "locale not to be unique" do
      locale = "en"
      build_page_info(locale: locale, name: "a").save!
      assert build_page_info(locale: locale, name: "b").valid?
    end

    test "content should be presence" do
      assert_not build_page_info(content: nil).valid?
    end
  end

end
