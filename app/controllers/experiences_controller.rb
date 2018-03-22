class ExperiencesController < ApplicationController
  def index
    @cv = Cv.find(params[:cv_id])
    @experiences= @cv.experiences
  end
  def new
    @cv = Cv.find(params[:cv_id])
    @experience = Experience.new
  end

  def create
    @cv = Cv.find(params[:cv_id])
    @experience= @cv.experiences.create(experience_params)
    if @experience.save
      redirect_to cvs_path, notice: "The experience has been added" and return
    else
      redirect_to cvs_path, notice: "DIDNT WORK TO ADD EXPERIENCE!" and return
    end
  render 'new'
  end
  def show
    @cv = Cv.find(params[:cv_id])
    @experiences= @cv.experiences
  end
private
  def experience_params
    params.require(:experience).permit(:company, :start_date, :end_date, :description)
  end
end