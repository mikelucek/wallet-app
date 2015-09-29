class Card < ActiveRecord::Base
	has_many :user_cards
	has_many :users, :through => :user_cards
	validates :cnumber, uniqueness: true
	validates_numericality_of :cnumber
	validates_length_of :cnumber, :is => 16
	validates_numericality_of :xmonth

	validates_numericality_of :xyear 

	validates :balance, numericality: { greater_than_or_equal_to: 0 }

end
