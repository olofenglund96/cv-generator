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

  def get_pdf
    @cv = Cv.find(params[:id])
    render pdf: 'test.pdf',
           template: 'cvs/pdf.html.erb',
           margin:  {
             top: 0,
             bottom: 0,
             left: 0,
             right: 0
          }
  end

  def destroy
    @cv = Cv.find(params[:id])
    @cv.destroy

    redirect_to cvs_path, notice: "#{:first_name} #{:last_name} has been deleted!" and return
  end
private
  def cv_params
    params.require(:cv).permit(:first_name, :last_name, :email, :personal_letter, :experience)
  end
end
