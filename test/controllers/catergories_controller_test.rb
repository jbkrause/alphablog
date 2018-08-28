require 'test_helper'

# rails 4: < ActionController::TestCase
class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
  end
  
  test "should get categories index" do
    get categories_path # in rails 4, use: get: index
    assert_response :success
  end

  test "should get new" do
    get new_category_path
    assert_response :success
  end

  test "should get show" do
    get category_path(@category)
    assert_response :success
  end

end
