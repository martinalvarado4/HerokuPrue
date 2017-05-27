class Visto < ApplicationRecord
	belongs_to :chapter
	has_and_belongs_to_many :users
end
