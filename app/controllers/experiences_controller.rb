class ExperiencesController < ApplicationController
  def index
    @cv = Cv.find(params[:cv_id])
    @experiences= @cv.experiences
  end
  def new
    @cv = Cv.find(params[:cv_id])
    @experience = Experience.new(:cv => @cv)
  end

  def create
    @user = current_user
    @cv = @user.cvs.find(params[:cv_id])
    @experience= @cv.experiences.build(experience_params)
    if @experience.save
      redirect_to request.referrer, notice: 'Experience added sucessfully!'
    else
      redirect_to request.referrer, alert: 'Failed to add experience.'
    end
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