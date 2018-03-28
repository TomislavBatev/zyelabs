class MatricSchoolReportsController < ApplicationController
  http_basic_authenticate_with name: "you_shall_not", password: "pass", except: :index


  def index
    @matric_school_reports = MatricSchoolReport.all
    @total_schools = @matric_school_reports.pluck(:school).uniq.count
    @yearly_summaries = @matric_school_reports.group_by{ |r| r.year }.map do |year, results|
      { year: year,
        wrote_total: results.map(&:wrote).sum,
        pass_total: results.map(&:passed).sum,
        pass_average: (results.map(&:passed).sum.to_f * 100/results.map(&:wrote).sum.to_f).to_i
      }
    end

    @histoplot_2014 = @matric_school_reports.where(year: 2016).where("wrote > 0").group_by{ |r| (r.passed.to_f * 100/r.wrote.to_f).to_i}.map{ |percentage, results| [percentage, results.count]}.sort
    @histoplot_2015 = @matric_school_reports.where(year: 2015).where("wrote > 0").group_by{ |r| (r.passed.to_f * 100/r.wrote.to_f).to_i}.map{ |percentage, results| [percentage, results.count]}.sort
    @histoplot_2016 = @matric_school_reports.where(year: 2014).where("wrote > 0").group_by{ |r| (r.passed.to_f * 100/r.wrote.to_f).to_i}.map{ |percentage, results| [percentage, results.count]}.sort

    respond_to do |format|
      format.html
      format.json { @matric_school_reports }
    end
  end

  def show
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
