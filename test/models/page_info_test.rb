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

  def create_page_info
    PageInfo.create!(
      name: "homepage",
      content: Oj.load(page_info_content)
    )
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
    def build_page_info(name: "homepage", content: Oj.load(page_info_content))
      PageInfo.new(
        name: name,
        content: content
      )
    end

    test "default object should be valid" do
      assert build_page_info.valid?
    end


    test "name should be presence" do
      assert_not build_page_info(name: nil).valid?
    end

    test "name should be unique" do
      name = "homepage"
      build_page_info(name: name).save!
      assert_not build_page_info(name: name).valid?
    end

    test "content should be presence" do
      assert_not build_page_info(content: nil).valid?
    end
  end

end
