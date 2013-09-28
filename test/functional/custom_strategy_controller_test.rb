require './test/test_helper'
require 'action_controller'
require 'action_controller/test_case'

class CustomStrategyTest < ActionController::TestCase
  tests RendersController

  setup do
    VersionCake::Configuration.extraction_strategy = lambda { |request| 2 }
  end

  test "renders version 2 of the partial based on the header Accept" do
    get :index
    assert_equal @response.body, "template v2"
  end
end
