class User < ApplicationRecord
	has_many :uattributes
	validates :name, presence: true	
	validates :phone, presence: true
	validates :email, presence: true
	validates :guraduate, presence: true
	validates :schoolname, presence: true
	validates :password, presence: true
end
