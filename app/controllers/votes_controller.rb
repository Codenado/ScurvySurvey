class VotesController < ApplicationController
  def create
  	@choice = Choice.find(params[:vote][:choice])
	unless @choice.question.users.include?(current_user)
		@vote = Vote.new(user: current_user, choice: @choice)
   		@vote.save
   		render @vote
  	end
  end
private
	def user_params
  		params.require(:vote).permit(:choice)
	end
end
