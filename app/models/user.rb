class User < ActiveRecord::Base
	extend FriendlyId
  	friendly_id :full_name, use: :slugged

	has_secure_password
	validates :email, :password_digest, presence: true
	validates :email, uniqueness: true 
	has_many :articles

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/




	def self.confirm(params)
	    @user = User.find_by({email: params[:email]})
	    @user.try(:authenticate, params[:password])
	end

end



