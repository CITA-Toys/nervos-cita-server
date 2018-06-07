require 'test_helper'

class Api::V1::PageInfosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @name = "homepage"
    @page_info = create_page_info(name: @name)
  end

  def create_page_info(name: "homepage")
    PageInfo.create!(
      name: name,
      locale: "zh-CN",
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
    assert @page_info.name, data["name"]
    assert_not @page_info.content.nil?
  end

  test "get page info by id" do
    get "/api/v1/page_infos/#{@page_info.id}"
    assert @page_info.name, data["name"]
  end

  test "can not find" do
    get "/api/v1/page_infos/nervos"
    assert status, ERROR_STATUS
    assert msg, I18n.t("page_infos.api.v1.not_found")
  end

  test "locale not right" do
    get "/api/v1/page_infos/#{@name}?locale=en"
    assert status, ERROR_STATUS
  end

  test "overwrite locale info" do
    get "/api/v1/page_infos/#{@name}?info_locale=en"
    assert status, ERROR_STATUS
  end

  test "right locale info" do
    get "/api/v1/page_infos/#{@name}?locale=zh-CN"
    assert status, SUCCESS_STATUS
  end
end
