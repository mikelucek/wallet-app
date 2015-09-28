class User < ActiveRecord::Base
	has_many :usercards
	has_many :cards, through: :usercards
end
