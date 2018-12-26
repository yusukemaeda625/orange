class Event < ApplicationRecord
	has_many :eusers
	has_many :eattributes
	has_many :evowners
	validates :name, presence: true	
	validates :content, presence: true	
	validates :date, presence: true	
	validates :number, presence: true	
	validates :place, presence: true	
	validates :fee, presence: true	
end
