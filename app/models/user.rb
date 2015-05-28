class User < ActiveRecord::Base
	has_many :votes
	has_many :surveys
	has_many :questions, through: :votes

	has_secure_password
	validates :email, presence: true, 
                  uniqueness: true,
                  format: {
                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  }

	 before_validation :downcase_email				

	def downcase_email 
		self.email = email.downcase
	end		
end
