class Event < ApplicationRecord
	has_many :eusers
	has_many :eattributes
	has_many :evowners
end
