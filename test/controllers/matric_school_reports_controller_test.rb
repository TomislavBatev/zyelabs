require 'test_helper'

class MatricSchoolReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matric_school_report = matric_school_reports(:one)
  end

  test "should get index" do
    get matric_school_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_matric_school_report_url
    assert_response :success
  end

  test "should create matric_school_report" do
    assert_difference('MatricSchoolReport.count') do
      post matric_school_reports_url, params: { matric_school_report: {  } }
    end

    assert_redirected_to matric_school_report_url(MatricSchoolReport.last)
  end

  test "should show matric_school_report" do
    get matric_school_report_url(@matric_school_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_matric_school_report_url(@matric_school_report)
    assert_response :success
  end

  test "should update matric_school_report" do
    patch matric_school_report_url(@matric_school_report), params: { matric_school_report: {  } }
    assert_redirected_to matric_school_report_url(@matric_school_report)
  end

  test "should destroy matric_school_report" do
    assert_difference('MatricSchoolReport.count', -1) do
      delete matric_school_report_url(@matric_school_report)
    end

    assert_redirected_to matric_school_reports_url
  end
end
