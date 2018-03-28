class MatricSchoolReportsController < ApplicationController

  def index
    matric_school_reports = MatricSchoolReport.all
    render json: matric_school_reports
  end

  def show
    binding.pry
    matric_school_reports = MatricSchoolReport.find(matric_school_report_id)
    render json: matric_school_reports
  end


  def create
    matric_school_report = MatricSchoolReport.new(matric_school_report_params)

    if matric_school_report.save
      head :ok
    else
      render json: matric_school_report.errors, status: :unprocessable_entity
    end
  end


  private
    def matric_school_report_params
      params.permit(:school, :year, :wrote, :passed, :id)
    end

    def matric_school_report_id
      matric_school_report_params["id"].to_i
    end
end
