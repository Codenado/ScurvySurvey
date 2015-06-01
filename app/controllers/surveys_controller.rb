class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy, :publish]
  before_action :authorize, only: [:show, :edit, :update, :destroy, :publish]
  # GET /surveys
  # GET /surveys.json
  def index
    @survey = Survey.new
    @surveys = Survey.all
  end

  def publish
    @survey.published = @survey.ready_publish
    if @survey.published
      @survey.save
      redirect_to @survey
    else
       redirect_to @survey
    end
  end  

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @vote = Vote.new
    unless @survey.published 
      redirect_to edit_survey_path(@survey)
    end  
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
    if @survey.user == current_user
      @question = Question.new
      @choice = Choice.new
    end
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
   if @survey.user == current_user
      @survey.destroy
        respond_to do |format|
        format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
        format.json { head :no_content }
      end
    end  
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name)
    end


end
