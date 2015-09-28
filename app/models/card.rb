class Card < ActiveRecord::Base
	has_many :usercards
	has_many :users, through: :usercards
	validates_numericality_of :cnumber
	validates_length_of :cnumber, :is==16
	validates_numericality_of :month

	validates_numericality_of :year 

	validates :balance, numericality: { greater_than_or_equal_to: 0 }

end
