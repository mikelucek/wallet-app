class User < ActiveRecord::Base
	has_many :usercards
	has_many :cards, through: :usercards
	validates :fname, :lname, :email, :phone, presence: true
	validates :email, uniqueness: true
	validates_length_of :phone, :is => 10
	validates_numericality_of :phone
end
