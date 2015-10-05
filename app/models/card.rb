class Card < ActiveRecord::Base
	has_many :user_cards
	has_many :users, :through => :user_cards
	validates :cnumber, uniqueness: true
	# validates_numericality_of :cnumber
	# validates_length_of :cnumber, :is => 16

	validates_format_of :cnumber, :with => /\A4[0-9]{15}|5[1-5][0-9]{14}|3[47][0-9]{13}|6(?:011|5[0-9]{2})[0-9]{12}\z/

	# #check against known card regexes
	#(?:4[0-9]{12}(?:[0-9]{3})?   visa   
 # |  5[1-5][0-9]{14}             MC
 # |  3[47][0-9]{13} 				amex
 # |  3(?:0[0-5]|[68][0-9])[0-9]{11}
 # |  6(?:011|5[0-9]{2})[0-9]{12} discover
 # |  (?:2131|1800|35\d{3})\d{11})\Z/

#validates :cnumber, with: /\A4\Z/}

	validates_numericality_of :xmonth
	validates_numericality_of :xyear 

	validates :balance, numericality: { greater_than_or_equal_to: 0 }

end
