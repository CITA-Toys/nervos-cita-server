require 'test_helper'

class PageInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in
    @page_info = PageInfo.create!(
      name: "one",
      locale: "zh-CN",
      content: { "CITA" => { "content" => "CITA is a balabala" }, "title" => { "content" => "Nervos CITA is a ...", "imageURL" => "www.example.com" } }
    )
  end

  test "should get index" do
    get page_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_page_info_url
    assert_response :success
  end

  test "should create page_info" do
    assert_difference('PageInfo.count') do
      post page_infos_url, params: { page_info: { content: Oj.dump([{"one": "two"}]), locale: @page_info.locale, name: "#{@page_info.name}1" } }
    end

    assert_redirected_to page_info_url(PageInfo.last)
  end

  test "should show page_info" do
    get page_info_url(@page_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_page_info_url(@page_info)
    assert_response :success
  end

  test "should update page_info" do
    patch page_info_url(@page_info), params: { page_info: { content: Oj.dump(@page_info.content), locale: @page_info.locale, name: @page_info.name } }
    assert_redirected_to page_info_url(@page_info)
  end

  test "should destroy page_info" do
    assert_difference('PageInfo.count', -1) do
      delete page_info_url(@page_info)
    end

    assert_redirected_to page_infos_url
  end
end
