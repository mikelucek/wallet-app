class Card < ActiveRecord::Base
	has_many :usercards
	has_many :users, through: :usercards
end
