class EducationsController < ApplicationController


  # GET /educations
  # GET /educations.json
  def index
    @cv = Cv.find(params[:cv_id])
    @educations = @cv.educations
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @cv = Cv.find(params[:cv_id])
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    @user = current_user
    @cv = @user.cvs.find(params[:cv_id])
    @education = @cv.educations.build(education_params)

    if @education.save
      redirect_to request.referrer, notice: 'Education added sucessfully'
    else
      redirect_to request.referrer, notice: 'Failed to add education'
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    respond_to do |format|
      if @education.update(education_params)
        format.html { redirect_to @education, notice: 'Education was successfully updated.' }
        format.json { render :show, status: :ok, location: @education }
      else
        format.html { render :edit }
        format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @cv = Cv.find(params[:cv_id])
    @education = @cv.educations.find(params[:id])
    @education.destroy
    respond_to do |format|
      format.html { redirect_to cv_educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:school, :subject, :description)
    end
end
