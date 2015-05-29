class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :votes
  has_many :users, through: :votes
end
