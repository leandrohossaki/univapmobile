require 'test_helper'

class UnitsCoursesControllerTest < ActionController::TestCase
  setup do
    @units_course = units_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:units_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create units_course" do
    assert_difference('UnitsCourse.count') do
      post :create, units_course: @units_course.attributes
    end

    assert_redirected_to units_course_path(assigns(:units_course))
  end

  test "should show units_course" do
    get :show, id: @units_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @units_course
    assert_response :success
  end

  test "should update units_course" do
    put :update, id: @units_course, units_course: @units_course.attributes
    assert_redirected_to units_course_path(assigns(:units_course))
  end

  test "should destroy units_course" do
    assert_difference('UnitsCourse.count', -1) do
      delete :destroy, id: @units_course
    end

    assert_redirected_to units_courses_path
  end
end
