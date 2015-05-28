require 'test_helper'

class TakenSurveysControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
