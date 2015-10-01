class User < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :full_name, use: :slugged

	has_secure_password
	validates :email, :password_digest, presence: true
	validates :email, uniqueness: true 
	has_many :articles




	def self.confirm(params)
	    @user = User.find_by({email: params[:email]})
	    @user.try(:authenticate, params[:password])
	end

end



