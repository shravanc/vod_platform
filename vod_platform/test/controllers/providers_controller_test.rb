require 'test_helper'
require 'json'

class ProvidersControllerTest < ActionDispatch::IntegrationTest

  test "Should get valid list of providers" do
    get '/providers?auth_token=abc'
    assert_response :success
    assert_equal response.content_type, 'application/json'
    jdata = JSON.parse response.body
    assert_equal 2, jdata['providers'].length
    assert_equal jdata['providers'][0]['title'], 'Netflix'
  end


  test "Should get valid provider data" do
    provider = providers('one')
    get "/providers/#{provider.id}?auth_token=abc" #, params: { id: provider.id }
    assert_response :success
    jdata = JSON.parse response.body
    puts jdata
    assert_equal provider.id, jdata['id']
    assert_equal provider.email, jdata['email']
  end

  test "Should get JSON:API error block when requesting provider data with invalid ID" do
    get "/providers/invalid?auth_token=abc"
    assert_response 404
    jdata = JSON.parse response.body
    assert_equal "Wrong ID provided", jdata['errors'][0]['detail']
    assert_equal '/data/attributes/id', jdata['errors'][0]['source']['pointer']
  end

end
