class CvsController < ApplicationController
  def index
    @cvs = Cv.all
  end
    
  def new
   @cv= Cv.new
  end
    
  def create
    @cv= Cv.new(cv_params)
      if @cv.save
        redirect_to cvs_path, notice: "The cv has been created!" and return
      end
    render 'new'
  end
  def show
      @cv = Cv.find(params[:id])
  end
  def destroy
    @cv = Cv.find(params[:id])
    @cv.destroy

    redirect_to people_path, notice: "#{:first_name} #{:last_name} has been deleted!" and return
  end
private
  def cv_params
    params.require(:cv).permit(:first_name, :last_name, :email, :personal_letter, :experience)
  end
end

