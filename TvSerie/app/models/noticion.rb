class Noticion < ApplicationRecord
	belongs_to :user
	belongs_to :serial, optional: true 
end
