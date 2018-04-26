# frozen_string_literal: true

class CvsController < ApplicationController

  def index; end

  def new
    @user = current_user
    @cv = Cv.new
  end

  def create
    #@cv = Cv.new(cv_params)
    @user = User.find(current_user)
    @cv = @user.cvs.build(cv_params)
    redirect_to(edit_user_cv_path(@user,@cv)) && return if @cv.save!
    render 'new'
  end

  def edit
    @user = current_user
    @cv = @user.cvs.find(params[:id])

    
    @experiences = @cv.experiences
    @experience = @cv.experiences.build
  end

  def update
    @cv = Cv.find(params[:id])
    redirect_to edit_cv_path(@cv) && return if @cv.update_attributes(cv_params)
  end

  def show
    @cv = Cv.find(params[:id])
  end

  def get_pdf
    @cv = Cv.find(params[:id])
    @template = 'cvs/pdf_templates/' + params[:cv_selector] + '_pdf.html.erb'

    render pdf: 'test.pdf',
           template: @template,
           margin:  {
             top: 0,
             bottom: 0,
             left: 0,
             right: 0
           },
           header: { html: { template: 'cvs/_header.pdf.html.erb' } }
  end

  def add_experience; end

  def destroy
    @cv = Cv.find(params[:id])
    @cv.destroy

    redirect_to(cvs_path, notice: 'first_name last_name has been deleted!') && return
  end

  private

  def cv_params
    params.require(:cv).permit(:cv_name, :first_name, :last_name, :email, :personal_letter, :experience, :cv_selector)
  end
end
