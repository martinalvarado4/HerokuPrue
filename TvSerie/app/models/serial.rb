class Serial < ApplicationRecord
	belongs_to :user
	has_many :reviewses, dependent: :destroy
	has_many :chapters, dependent: :destroy
	has_many :noticions, dependent: :destroy
  #def self.filter(filter)
    #if filter[0]
    #  where(genero: filter[0])
    #elsif filter[1]
    #  where(ano: filter[1])
   # end
  #end
end
