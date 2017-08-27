require 'test_helper'

class InfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get infos_index,_url
    assert_response :success
  end

  test "should get show," do
    get infos_show,_url
    assert_response :success
  end

  test "should get new," do
    get infos_new,_url
    assert_response :success
  end

  test "should get edit" do
    get infos_edit_url
    assert_response :success
  end

end
