class TakenSurveysController < ApplicationController
  def create
  	TakenSurvey.create(user: current_user, survey_id: params[:id])
  end
end
