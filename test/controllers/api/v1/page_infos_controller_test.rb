require 'test_helper'

class Api::V1::PageInfosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @name = "homepage"
    @page_info = create_page_info(name: @name)
  end

  def body
    Oj.load(response.body)
  end

  def create_page_info(name: "homepage")
    PageInfo.create!(
      name: name,
      content: {
        title: {
          content: "Nervos cita is a ...",
          imageURL: "www.example.com"
        }
      }
    )
  end

  test "get page info by name" do
    get "/api/v1/page_infos/#{@name}"
    assert @page_info.name, body["name"]
    assert_not @page_info.content.nil?
  end

  test "get page info by id" do
    get "/api/v1/page_infos/#{@page_info.id}"
    assert @page_info.name, body["name"]
  end

  test "can not find" do
    get "/api/v1/page_infos/nervos"
    assert body, {}
  end
end
