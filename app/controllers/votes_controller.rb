class VotesController < ApplicationController
  def create
  @vote = Vote.new(user: current_user, choice_id: :choice)
   @vote.save
  end
end
