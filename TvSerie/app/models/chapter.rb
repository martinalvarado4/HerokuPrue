class Chapter < ApplicationRecord
  belongs_to :user
  belongs_to :serial
  has_many :reviewches, dependent: :destroy
  has_one :visto, dependent: :destroy
end
