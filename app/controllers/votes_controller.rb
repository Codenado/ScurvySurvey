class VotesController < ApplicationController
  def create
  	p params[:vote][:choice]
  @vote = Vote.new(user: current_user, choice_id: params[:vote][:choice])
   p @vote
   @vote.save
  end
private
	def user_params
  		params.require(:vote).permit(:choice)
	end
end
