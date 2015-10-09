class User < ActiveRecord::Base
	has_many :user_cards
	has_many :cards, :through => :user_cards
	validates :fname, :lname, :email, :phone, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	#....but see the article at http://davidcel.is/posts/stop-validating-email-addresses-with-regex/
	validates_length_of :phone, :is => 10
	validates_numericality_of :phone
end
