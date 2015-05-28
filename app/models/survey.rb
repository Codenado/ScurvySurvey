class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :taken_surveys
  has_many :takers, through: :taken_surveys, source: :user
  has_many :questions


  def get_users
  	case self.takers.length
  	when 0
  		return "Nobody has taken this survey yet. Be the first to take "
  	when 1
  		return "#{self.takers[0].name} has taken this survey."
  	when 2
  		return "#{self.takers[0].name} and #{self.takers[1].name} have taken this survey."
	when 3
		return "#{self.takers[0].name}, #{self.takers[1].name} and #{self.takers[2].name} have taken this survey."
	else
		return "#{self.takers[0].name}, #{self.takers[1].name}, #{self.takers[2].name} and #{self.takers.length - 3} have taken this survey."
	end
  end	
end
